////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_pack.sv
//description: file for declaring the macros
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//Async FIFO macros

`ifndef FIFO_DEFINE
`define FIFO_DEFINE

`define WR_DRV vintf.wr_drv_mp.wr_drv_cb
`define RD_DRV vintf.rd_drv_mp.rd_drv_cb
`define WR_MON vintf.wr_mon_mp.wr_mon_cb
`define RD_MON vintf.rd_mon_mp.rd_mon_cb

`endif
