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
  //continuous write and read testcase handle
  fifo_gen_continuous_wr_rd continuous_wr_rd_h;
  //full flag testcase handle
  fifo_gen_full_flag full_flag_h;
  //empty flag testcase handle
  fifo_gen_empty_flag empty_flag_h;
  //almostfull flag testcase handle
  fifo_gen_almostfull_flag almostfull_flag_h;
  //almostempty flag testcase handle
  fifo_gen_almostempty_flag almostempty_flag_h;
  //inbetween reset testcase handle
  fifo_gen_inbet_rst inbet_rst_h;
  //reading when empty testcase handle
  fifo_gen_read_empty read_empty_h;
  //writing when full testcase handle
  fifo_gen_write_full write_full_h;

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
    end
    if($test$plusargs("CONTINUOUS_WR_RD")) begin
      continuous_wr_rd_h = new();
      env_h.gen_h = continuous_wr_rd_h;
    end
    if($test$plusargs("FULL_FLAG")) begin
      full_flag_h = new();
      env_h.gen_h = full_flag_h;
    end
    if($test$plusargs("EMPTY_FLAG")) begin
      empty_flag_h = new();
      env_h.gen_h = empty_flag_h;
    end
    if($test$plusargs("ALMOSTFULL_FLAG")) begin
      almostfull_flag_h = new();
      env_h.gen_h = almostfull_flag_h;
    end
    if($test$plusargs("ALMOSTEMPTY_FLAG")) begin
      almostempty_flag_h = new();
      env_h.gen_h = almostempty_flag_h;
    end
    if($test$plusargs("INBETWEEN_RESET")) begin
      inbet_rst_h = new();
      env_h.gen_h = inbet_rst_h;
    end
    if($test$plusargs("READ_EMPTY")) begin
      read_empty_h = new();
      env_h.gen_h = read_empty_h;
    end
    if($test$plusargs("WRITE_FULL")) begin
      write_full_h = new();
      env_h.gen_h = write_full_h;
    end
		env_h.connect(vintf);
	endfunction

	// running
	task run();
		env_h.run();
	endtask

endclass
`endif
