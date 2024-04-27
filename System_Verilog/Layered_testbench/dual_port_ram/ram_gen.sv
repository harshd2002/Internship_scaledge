//RAM generator class

class mem_gen;

	//object of transaction class to store data
	mem_trans trans_obj;

	//mailbox to store data 
	mailbox #(mem_trans) gen_drv;

	//function to connect mailbox
	function new(mailbox #(mem_trans) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//task to generate and store data
	task run();
		repeat(5) begin
		wait(item_done.triggered);
		trans_obj = new();
		trans_obj.randomize();
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
		end
	endtask

endclass
