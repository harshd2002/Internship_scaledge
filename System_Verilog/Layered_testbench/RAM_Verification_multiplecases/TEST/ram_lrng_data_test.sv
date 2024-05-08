class ram_lrng_data_test extends ram_base_test;

	
	//testcases
	ram_lrng_data_xtn lxtn;

	function void build_env();
	    super.build_env();
	    lxtn = new();
	endfunction

	function void connect(virtual ram_intf vintf);
	    
	    env_h.gen = lxtn;
		super.connect(vintf)
	endfunction
	
endclass

//properly save all the files
//In env and test files
//make new function to pass the reference of the actual interface block
//and then pass that to next class top -> test -> end -> drv
