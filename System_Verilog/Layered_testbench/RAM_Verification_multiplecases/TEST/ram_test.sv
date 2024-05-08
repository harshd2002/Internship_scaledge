class ram_base_test;
	
	//environment class handle
	ram_env env_h = new();
	//virtual interface 
	virtual ram_intf vintf;
	
	//testcases
	ram_lrng_data_xtn lxtn;
	ram_hrng_data_xtn hxtn;

//	function new(virtual ram_intf vintf);
	//	this.vintf = vintf;
	//endfunction

	virtual function void build_env();
				env_h.build();
	endfunction

	virtual function void connect(virtual ram_intf vintf);
	    if ($test$plusargs("LRANGE_DATA_TEST")) begin
		  no_of_trans = 70;
		  lxtn = new();
		  env_h.gen = lxtn;
		end
		if ($test$plusargs("HRANGE_DATA_TEST")) begin
		  no_of_trans = 100;
		  hxtn = new();
		  env_h.gen = hxtn;
		end
		env_h.connect(vintf);
	endfunction

	virtual task run_phase();

		env_h.run_phase();
	endtask

endclass

//properly save all the files
//In env and test files
//make new function to pass the reference of the actual interface block
//and then pass that to next class top -> test -> end -> drv
