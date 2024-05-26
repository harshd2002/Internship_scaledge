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
    P_ADDR: coverpoint vintf.Paddr[4:0] {
      bins LOW_ADDR[3]   = {[1:30]};
      bins BOUNDARY_ADDR = {0,31};
    }
    P_WDATA: coverpoint vintf.Pwdata {
      bins LOW_DATA      = {[32'h1:32'hFFFF]};
      bins MED_DATA      = {[32'h10000:32'hFFFFFF]};
      bins HIGH_DATA     = {[32'h1000000:32'hFFFFFFFE]};
      bins BOUNDARY_DATA = {0,32'hFFFFFFFF};
    }
    P_SEL: coverpoint vintf.Psel {
      bins select[] = {0, 1};
      bins select_trans[] = (0=>1, 1=>0);
    }
    P_ENABLE: coverpoint vintf.Penable {
      bins enable[] = {0, 1};
      bins enable_trans[] = (0=>1, 1=>0);
    }
    P_WRITE: coverpoint vintf.Pwrite {
      bins write = {0, 1};
      bins write_trans[] = (0=>1, 1=>0);
    }
    CROSS_WDATA: cross P_SEL, P_ENABLE, P_ADDR, P_WDATA {
      ignore_bins ignore_sel_trans = binsof(P_SEL.select_trans);
      ignore_bins ignore_sel_low = binsof(P_SEL.select) intersect {0};
      ignore_bins ignore_enable_trans = binsof(P_ENABLE.enable_trans);
      ignore_bins ignore_enable_low = binsof(P_ENABLE.enable) intersect {0};
    }
  endgroup

  covergroup output_cvg with function sample(bit [31:0] Prdata);
    P_RDATA: coverpoint Prdata {
      bins LOW_DATA[3]   = {[32'h1:32'hFFFFFFFE]};
      bins BOUNDARY_DATA[] = {0,32'hFFFFFFFF};
    }
    
  endgroup

  function new();
    range_cvg  = new();
    output_cvg = new();
  endfunction

  task run();
    forever begin
      mon_func_cvg.get(trans_h);
      range_cvg.sample();
      output_cvg.sample(trans_h.Prdata);
    end
  endtask

endclass

`endif
