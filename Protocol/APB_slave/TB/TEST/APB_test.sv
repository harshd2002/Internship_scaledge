////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB environment class

`ifndef APB_TEST
`define APB_TEST

class apb_test;
	//environment object
	apb_env env_h;
 
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
    env_h.connect(vintf);
  endtask

  //run method
  task run();
    env_h.run();
  endtask
  
endclass

`endif
