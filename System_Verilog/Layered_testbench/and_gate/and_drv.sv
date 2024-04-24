//and gate driver class

class and_drv;
//handle to recieve data
	and_transaction trans_obj;

//mailbox 
	mailbox #(and_transaction) gen_dr;

	//function to point to main mailbox
	function void connect(mailbox #(and_transaction) gen_dr);
		this.gen_dr = gen_dr;
	endfunction
	//function to get data
	task run();
			 gen_dr.get(trans_obj);
			 $display($time," : %0d: driver get data: %p", gen_dr.num(), trans_obj);
	endtask
endclass
