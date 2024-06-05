////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB package file 

parameter TIMER_OUT = 10;

`include "def_global.sv"
`include "APB_intf.sv"

package apb_pack;
  
  //enum type variable to select operation type
  typedef enum {P_WRITE, P_READ} operation;

  //timer for reset de-assertion
  byte unsigned RST_TIME = 15;
  byte unsigned INBET_RST = 24;

  //number of transfer
  byte unsigned trans_num = 5;

  //event for reset
  event reset_evt;
  event item_done;
  //queue for inorder scorebard
  static bit [31:0] exp_q[$], act_q[$];

  `include "APB_trans.sv"
  `include "APB_gen_base.sv"
  `include "APB_sanity.sv"
  `include "APB_wait_state_wr.sv"
  `include "APB_back2back_wr.sv"
  `include "APB_back2back_wr_ws.sv"
  `include "APB_drv.sv"
  `include "APB_mon.sv"
  `include "APB_func_cvg.sv"
  `include "APB_pred.sv"
  `include "APB_scrbd.sv"
  `include "APB_env.sv"

endpackage
