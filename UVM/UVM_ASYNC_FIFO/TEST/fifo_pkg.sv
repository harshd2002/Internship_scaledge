////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_pkg.sv
//File_Path    : 
//Class_Name   : fifo_pkg               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_PACKAGE
`define AFIFO_PACKAGE

`define WR_DRV vintf.wr_drv_mp.wr_drv_cb
`define RD_DRV vintf.rd_drv_mp.rd_drv_cb
`define WR_MON vintf.wr_mon_mp.wr_mon_cb
`define RD_MON vintf.rd_mon_mp.rd_mon_cb

`include "fifo_intf.sv"

package fifo_pkg;
  byte unsigned RST_TIME = 10;
  byte unsigned WR_COUNT = 10;
  byte unsigned RD_COUNT = 10;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

    `include "fifo_seqs_item.sv"
    `include "fifo_sequencer.sv"
//  `include "fifo_vseqr.sv"
    `include "fifo_base_seqs.sv"
    `include "fifo_write_seqs.sv"
    `include "fifo_read_seqs.sv"
//  `include "fifo_base_vseqs.sv"
//  `include "fifo_vseqs_continuous_wr_rd.sv"
    `include "fifo_drv_cb.sv"
    `include "fifo_driver.sv"
    `include "fifo_mon.sv"
    `include "fifo_agent.sv"
    `include "fifo_scrbd.sv"
    `include "fifo_env.sv"
    `include "fifo_base_test.sv"
    `include "fifo_sanity_test.sv"
    `include "fifo_full_flag_test.sv"
    `include "fifo_empty_flag_test.sv"
    `include "fifo_almostfull_flag_test.sv"
    `include "fifo_almostempty_flag_test.sv"
    `include "fifo_overflow_flag_test.sv"
    `include "fifo_underflow_flag_test.sv"

endpackage

`endif
