////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB generator class

`ifndef APB_INTERFACE
`define APB_INTERFACE

interface apb_intf(input Pclk, input Preset);
  logic [31:0] Paddr;
  logic [31:0] Pwdata, Prdata;
  logic Psel, Penable, Pwrite;
  logic Pready, Pslverr;

  clocking apb_cb_drv @(posedge Pclk);
    default input #0 output #1;
    output Psel, Penable, Pwrite, Paddr, Pwdata;
    input Pready;
  endclocking

  clocking apb_cb_mon @(posedge Pclk);
    input Psel, Penable, Pwrite, Paddr, Pwdata;
    input Prdata,Pready,Pslverr;
  endclocking

  modport apb_mp_drv(clocking apb_cb_drv, input Pclk, input Preset);
  modport apb_mp_mon(clocking apb_cb_mon, input Pclk, input Preset);

endinterface

`endif
