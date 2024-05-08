`include "transaction.sv"
//generator class

class generator;

	//object of transaction class to store data
	transaction trans_obj;

	//mailbox to store data 
	mailbox #(transaction) gen_drv;

	//function to connect mailbox
	function new(mailbox #(transaction) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//task to generate and store data
	task run();
		trans_obj = new();
		trans_obj.randomize();
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
	endtask

endclass
