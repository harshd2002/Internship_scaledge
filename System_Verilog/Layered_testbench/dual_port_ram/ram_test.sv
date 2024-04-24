//RAM test class

class mem_test;
	mem_env env_obj;
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	function new(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
	this.vintf = vintf;
	endfunction
	task build_run();
		env_obj = new(vintf);
		env_obj.build();
		env_obj.run();
		$display("test build_run completed");
	endtask
endclass
