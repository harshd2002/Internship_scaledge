////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_test.sv
//description: test class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM test class

`ifndef RAM_TEST
`define RAM_TEST

class mem_test;
	//environment object
	mem_env env_h;
  //sanity testcase handle
  mem_gen_sanity_test sanity_test;
  //simultaneous write_read testcase handle
  mem_gen_simultaneous_wr simultaneous_wr;
  //continuous write_read testcase handle
  mem_gen_continuous_wr continuous_wr;
  //back to back write_read testcase handle
  mem_gen_backtoback_wr backtoback_wr;
  //Inbetween reset testcase handle
  mem_gen_inbetween_reset inbetween_reset;
	//virtual interface to pass interface
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
  //building
  task build();
		env_h = new();
		env_h.build();
  endtask
	//passing interface
	function connect(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.vintf = vintf;
    if($test$plusargs("SANITY_TEST")) begin
      sanity_test = new();
      env_h.gen_h = sanity_test;
    end
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
    end
		env_h.connect(vintf);
	endfunction
	// running
	task run();
		env_h.run();
	endtask
endclass
`endif
