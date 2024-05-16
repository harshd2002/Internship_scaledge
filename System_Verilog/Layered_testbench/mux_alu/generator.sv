//generator class

virtual class generator;

	//object of transaction class to store data
	transaction trans_h;

	//mailbox to store data 
	mailbox #(transaction) gen_drv;

	//function to connect mailbox
	function void connect(mailbox #(transaction) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//task to generate and store data
	pure virtual task run();
	/*	trans_h = new();
		trans_h.randomize();
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    trans_h.print_trans("generator");
    @(item_done);
	endtask*/

endclass
