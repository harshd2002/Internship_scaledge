//and environment

class and_env;
	mailbox #(and_transaction) gen_dr = new();
	and_gen gen_obj = new();
	and_drv drv_obj = new();

	//virtual interface
	virtual and_intf and_vif;
	
	//connecting virtual interface
	function new(virtual and_intf and_vif);
		this.and_vif = and_vif;
	endfunction

	//calling connect methods og generator and driver
	function void build();
		gen_obj.connect(gen_dr);
		drv_obj.connect(gen_dr);
	endfunction
	//task to call the run methods
	task run();
		fork
			gen_obj.run();
			drv_obj.run();
		join
		and_vif.a_i = drv_obj.trans_obj.a_i;
		and_vif.b_i = drv_obj.trans_obj.b_i;
		#1;
		drv_obj.trans_obj.y_o = and_vif.y_o;
		$display("passed values to interface.");
		$display($time," : %0d: data: %p", gen_dr.num(), drv_obj.trans_obj);
	endtask
	
endclass
