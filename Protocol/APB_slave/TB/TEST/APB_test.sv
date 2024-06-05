////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB test class

`ifndef APB_TEST
`define APB_TEST

class apb_test;
	//environment object
	apb_env env_h;

  //handle for sanity check
  apb_sanity sanity_h;

  //handle for transfers with wait_state 
  apb_wait_state wait_state_h;

  //handle for back to back transfers without wait_state
  apb_back2back_wr back2back_wr_h;

  //handle for back to back transfers with wait_state
  apb_back2back_wr_ws back2back_wr_ws_h;

	//virtual interface to pass interface
	virtual apb_intf vintf;

  //building method
  task build();
    env_h = new();
    env_h.build();
  endtask

  //connect method
  task connect(virtual apb_intf vintf);
    this.vintf = vintf;
    if($test$plusargs("SANITY_WR")) begin
      sanity_h = new();
      env_h.gen_h = sanity_h;
    end
    if($test$plusargs("WAIT_STATE_WR")) begin
      wait_state_h = new();
      env_h.gen_h = wait_state_h;
      apb_top.dut.wait_state = 1;
      apb_top.dut.time_out = 15;
    end
    if($test$plusargs("BACK2BACK_WR")) begin
      back2back_wr_h = new();
      env_h.gen_h = back2back_wr_h;
    end
    if($test$plusargs("BACK2BACK_WR_WS")) begin
      back2back_wr_ws_h = new();
      env_h.gen_h = back2back_wr_ws_h;
      apb_top.dut.wait_state = 1;
      apb_top.dut.time_out = 5;
    end
    env_h.connect(vintf);
  endtask

  //run method
  task run();
    env_h.run();
  endtask

endclass

`endif
