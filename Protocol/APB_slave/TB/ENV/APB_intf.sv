////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB interface

`ifndef APB_INTERFACE
`define APB_INTERFACE

interface apb_intf(input Pclk, input Presetn);
  logic [31:0] Paddr;
  logic [31:0] Pwdata, Prdata;
  logic Psel, Penable, Pwrite;
  logic Pready, Pslverr;

  clocking apb_cb_drv @(posedge Pclk);
    default input #1 output #1;
    output Psel, Penable, Pwrite, Paddr, Pwdata;
    input Pready;
  endclocking

  clocking apb_cb_mon @(posedge Pclk);
    default input #0 output #1;
    input Psel, Penable, Pwrite, Paddr, Pwdata;
    input Prdata,Pready,Pslverr;
  endclocking

  modport apb_mp_drv(clocking apb_cb_drv, input Pclk, input Presetn);
  modport apb_mp_mon(clocking apb_cb_mon, input Pclk, input Presetn);

  property enb_after_sel;
    Psel |=> Penable;
  endproperty

  property ready_after_sel_and_enb;
    (Psel && Penable) |->[*0:$] Pready;
  endproperty

  property signal_stability;
    Psel |-> ($stable(Paddr) && $stable(Pwdata) && $stable(Pwrite);
  endproperty

  property 

endinterface

`endif
