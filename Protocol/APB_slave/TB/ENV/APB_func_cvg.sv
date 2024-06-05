////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB functional coverage 

`ifndef APB_FUNCTIONAL_CVG
`define APB_FUNCTIONAL_CVG

class apb_functional_cvg;
  //transaction class object
  apb_trans trans_h;
  //virtual interface
  virtual apb_intf vintf;
  //mailbox from monitor
  mailbox #(apb_trans) mon_func_cvg;

  function void connect(virtual apb_intf vintf, mailbox #(apb_trans) mon_func_cvg);
    this.vintf = vintf;
    this.mon_func_cvg = mon_func_cvg;
  endfunction

  covergroup range_cvg;

    option.per_instance = 1;
    option.comment      = "cover_group for input signals of slave";

    P_ADDR: coverpoint vintf.Paddr[4:0] {
      option.comment       = "Paddr range hit";
      bins LOW_ADDR[3]     = {[1:30]};
      bins BOUNDARY_ADDR[] = {0,31};
    }
    P_WDATA: coverpoint vintf.Pwdata {
      option.comment       = "Pwdata range hit";
      bins LOW_DATA        = {[32'h1:32'hFFFF]};
      bins MED_DATA        = {[32'h10000:32'hFFFFFF]};
      bins HIGH_DATA       = {[32'h1000000:32'hFFFFFFFE]};
      bins BOUNDARY_DATA[] = {0,32'hFFFFFFFF};
    }
    P_SEL: coverpoint vintf.Psel {
      option.comment        = "Pselect transition check";
      bins select[]         = {0, 1};
      bins select_trans_0_1 = (0=>1);
      bins select_trans_1_0 = (1=>0);
    }
    P_ENABLE: coverpoint vintf.Penable {
      option.comment        = "Penable transition check";
      bins enable[]         = {0, 1};
      bins enable_trans_0_1 = (0=>1);
      bins enable_trans_1_0 = (1=>0);
    }
    P_WRITE: coverpoint vintf.Pwrite {
      option.comment       = "Pwrite transition check";
      bins write           = {0, 1};
      bins write_trans_0_1 = (0=>1);
      bins write_trans_1_0 = (1=>0);
    }
    P_RESET: coverpoint vintf.Presetn {
      option.comment       = "Presetn transition check";
      bins reset           = {0, 1};
      bins reset_trans_0_1 = (0=>1);
      bins reset_trans_1_0 = (1=>0);
    }
    CROSS_WDATA: cross P_SEL, P_ENABLE, P_ADDR, P_WDATA {
      option.comment                  = "cross coverage for write data at the addresses.";
      ignore_bins ignore_sel_trans    = binsof(P_SEL.select_trans_0_1) || binsof(P_SEL.select_trans_1_0);
      ignore_bins ignore_sel_low      = binsof(P_SEL.select) intersect {0};
      ignore_bins ignore_enable_trans = binsof(P_ENABLE.enable_trans_0_1) || binsof(P_ENABLE.enable_trans_1_0);
      ignore_bins ignore_enable_low   = binsof(P_ENABLE.enable) intersect {0};
    }
  endgroup

  covergroup output_cvg with function sample(bit [31:0] Prdata, bit Pslverr, bit Pready);
    option.comment = "cover_group for checking output signals of slave.";
    P_RDATA: coverpoint Prdata {
      option.comment       = "Prdata range hit";
      bins LOW_DATA[3]     = {[32'h1:32'hFFFFFFFE]};
      bins BOUNDARY_DATA[] = {0,32'hFFFFFFFF};
    }
    P_READY: coverpoint Pready {
      option.comment       = "Pready transition check";
      bins ready           = {0, 1};
      bins ready_trans_0_1 = (0=>1);
      bins ready_trans_1_0 = (1=>0);
    }
    P_SLVERR: coverpoint Pslverr {
      option.comment         = "Pslverr transition check";
      bins slv_error         = {0, 1};
      bins slv_err_trans_0_1 = (0=>1);
      bins slv_err_trans_1_0 = (1=>0);
    }
  endgroup

  function new();
    range_cvg  = new();
    output_cvg = new();
  endfunction

  task run();
    fork
    forever @(posedge vintf.Pclk or negedge vintf.Presetn) begin
      range_cvg.sample();
    end
    forever begin
      mon_func_cvg.get(trans_h);
      output_cvg.sample(trans_h.Prdata, trans_h.Pready, trans_h.Pslverr);
    end
    join
  endtask

endclass

`endif
