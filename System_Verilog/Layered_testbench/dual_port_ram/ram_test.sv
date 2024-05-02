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
	mem_env env_obj;
  //sanity testcase object
  mem_gen_sanity_test sanity_test;
	//virtual interface to pass interface
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
  //building
  task build();
		env_obj = new();
		env_obj.build();
  endtask
	//passing interface
	function connect(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.vintf = vintf;
    //if($test$plusargs("SANITY_TEST")) begin
      sanity_test = new();
      env_obj.gen_obj = sanity_test;
    //end
		env_obj.connect(vintf);
	endfunction
	// running
	task run();
		env_obj.run();
	endtask
endclass
`endif
