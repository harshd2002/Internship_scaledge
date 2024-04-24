//generator class for and gate

class and_gen;
	//handle of transaction class which will be randomized
	and_transaction trans_obj;
	//mailbox
	mailbox #(and_transaction) gen_dr;

	/*function new(mailbox gen_dr);
		this.gen_dr = gen_dr;
	endfunction*/
	//function to point to main mailbox
	function void connect(mailbox #(and_transaction) gen_dr);
		this.gen_dr = gen_dr;
	endfunction
	//function to generate data and to put in mailbox
	task run();
		trans_obj = new();
		trans_obj.randomize();
		gen_dr.put(trans_obj);
			 $display($time," : %0d: generator put data: %p", gen_dr.num(), trans_obj);
	endtask
endclass
