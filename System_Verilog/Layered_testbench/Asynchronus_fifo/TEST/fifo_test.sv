////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project:Asynchronous FIFO verification
//File name: fifo_test.sv
//description: test class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO test class

`ifndef FIFO_TEST
`define FIFO_TEST

class fifo_test;
	//environment object
	fifo_env env_h;
  //sanity testcase handle
  fifo_gen_sanity sanity_h;
	//virtual interface to pass interface
	virtual fifo_intf vintf;

  //building
  task build();
		env_h = new();
		env_h.build();
  endtask
	//passing interface
	function void connect(virtual fifo_intf vintf);
		this.vintf = vintf;
    if($test$plusargs("SANITY")) begin
      sanity_h = new();
      env_h.gen_h = sanity_h;
    end/*
    if($test$plusargs("SIMULTANEOUS_WR")) begin
      simultaneous_wr = new();
      env_h.gen_h = simultaneous_wr;
    end
    if($test$plusargs("CONTINUOUS_WR")) begin
      continuous_wr = new();
      env_h.gen_h = continuous_wr;
    end
    if($test$plusargs("BACKTOBACK_WR")) begin
      backtoback_wr = new();
      env_h.gen_h = backtoback_wr;
    end
    if($test$plusargs("INBETWEEN_RESET")) begin
      inbetween_reset = new();
      env_h.gen_h = inbetween_reset;
    end*/
		env_h.connect(vintf);
	endfunction

	// running
	task run();
		env_h.run();
	endtask

endclass
`endif
