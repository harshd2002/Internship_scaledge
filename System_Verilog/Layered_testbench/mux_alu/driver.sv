`include "transaction.sv"
//driver class

class driver;
	//object of transaction class to store data
	transaction trans_obj;
	//mailbox to get data from generator
	mailbox #(transaction) gen_drv;
	//virtual interface to connect with original interface (mem_intf)
	virtual mux_interface vintf;
	//connecting mailbox and virtual interface
	function new(mailbox #(transaction) gen_drv, virtual mux_interface vintf);
		this.gen_drv = gen_drv;
		this.vintf = vintf;
	endfunction
	//converting transaction level data to pin level
	task run();
		gen_drv.get(trans_obj);
		$display($time," : driver: %0p", trans_obj);

		//logic for pins
			vintf.sel_i = (bit'(trans_obj.ops_e));
			vintf.A = trans_obj.A;
			vintf.B = trans_obj.B;
			vintf.C = trans_obj.C;
			vintf.D = trans_obj.D;
	endtask
endclass
