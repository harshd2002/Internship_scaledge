////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_pack.sv
//description: package for including all files
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//Async FIFO package file

`ifndef FIFO_PACKAGE
`define FIFO_PACKAGE

`include "fifo_def.sv"
`include "fifo_intf.sv"

package fifo_pack;
  //enum type variable to select operation type
  typedef enum {WRITE, READ} operation;

  //variables for storing time out time and reset time
  byte unsigned INBET_RST_TIME = 40;
  byte unsigned RST_TIME = 17;
  //variable for storing number of transactions
  byte unsigned NUM_TRANS = 10;
  byte unsigned WR_COUNT = 0, RD_COUNT = 0;

  //flag to override driver
  bit override_flag;

  //event to trigger reset
  event rst_evt;
  
  //object raise and drop variabele
  static bit [3:0] object_count;

  //object raise and drop methods
  function static void object_raise();
    object_count++;
    $info("Object raised: %0d", object_count);
  endfunction

  function static void object_drop();
    object_count--;
    $info("Object drop: %0d", object_count);
  endfunction

  `include "fifo_trans.sv"
  `include "fifo_functional_cvg.sv"
  `include "fifo_gen.sv"
  `include "fifo_gen_sanity.sv"
  `include "fifo_gen_continuous_wr_rd.sv"
  `include "fifo_gen_full_flag.sv"
  `include "fifo_gen_empty_flag.sv"
  `include "fifo_gen_almostfull_flag.sv"
  `include "fifo_gen_almostempty_flag.sv"
  `include "fifo_gen_inbet_rst.sv"
  `include "fifo_gen_read_empty.sv"
  `include "fifo_gen_write_full.sv"
  `include "fifo_drv.sv"
  `include "fifo_mon.sv"
  `include "fifo_pred.sv"
  `include "fifo_scrbd.sv"
  `include "fifo_env.sv"
  `include "fifo_test.sv"

endpackage

`endif
