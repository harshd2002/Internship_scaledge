//RAM test class

class mem_test;
	//environment object
	mem_env env_obj;
	//virtual interface to pass interface
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//passing interface
	function new(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.vintf = vintf;
	endfunction
	//building and running
	task build_run();
		env_obj = new(vintf);
		env_obj.build();
		env_obj.run();
		$display("test build_run completed");
	endtask
endclass
