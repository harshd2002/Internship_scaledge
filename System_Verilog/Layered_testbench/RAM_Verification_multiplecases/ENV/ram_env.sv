`ifndef RAM_ENV_SV
`define RAM_ENV_SV
class ram_env;
	
	ram_gen gen;
	ram_drv drv;
	ram_mon mon;
	ram_refm refm;
	//mailbox for driver and generator
	mailbox #(ram_trans) gen_drv = new();

	//mailbox for mon and reference model
	mailbox #(ram_trans) mon_ref = new();

	//virtual interface 
	virtual ram_intf vintf;

	function void build();

	  //creating object of ram_generator class gen
		//gen = new(); //connecting mailbox gen_drv
		//creating object of ram_driver class drv
		drv = new(); //connecting mailbox gen_drv
		mon = new();
		refm = new();

	endfunction

	function void connect(virtual ram_intf vintf);
		gen.connect(gen_drv);
		drv.connect(gen_drv,vintf);
		mon.connect(mon_ref,vintf);
		refm.connect(mon_ref);
	endfunction

	task run_phase();
	  gen.notrans = 50;
		fork 
		  drv.reset();
			gen.run_phase();
			drv.run_phase();
			mon.run_phase();
			refm.run_phase();
		join_none
	//	#300;
		//$finish;

	endtask

endclass
`endif
