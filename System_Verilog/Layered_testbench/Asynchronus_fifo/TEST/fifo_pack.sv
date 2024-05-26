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
  typedef enum {RESET, WRITE, READ, WRITE_READ} operation;
  //variables for storing time out time and reset time
  byte unsigned TIME_OUT = 40;
  byte unsigned RST_TIME = 15;
  //event to trigger reset
  event wr_done, rd_done, rst_evt;
  
  //object raise and drop variabele
  static bit [2:0] object_count;

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
  `include "fifo_gen.sv"
  `include "fifo_gen_sanity.sv"
  `include "fifo_drv.sv"
  `include "fifo_mon.sv"
  `include "fifo_pred.sv"
  `include "fifo_scrbd.sv"
  `include "fifo_env.sv"
  `include "fifo_test.sv"

endpackage

`endif
