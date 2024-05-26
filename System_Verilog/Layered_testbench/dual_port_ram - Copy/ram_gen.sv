////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR
`define RAM_GENERATOR

virtual class mem_gen;

	//object of transaction class to store data
	mem_trans trans_obj;

	//mailbox to store data 
	mailbox #(mem_trans) gen_drv;

	//function to connect mailbox
	function connect(mailbox #(mem_trans) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//task to generate and store data
	pure virtual task run();
		/*repeat(5) begin
    @(item_done)
		//wait(item_done.triggered);
		trans_obj = new();
		trans_obj.randomize() with {wr_addr==rd_addr;};
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
		end
	endtask*/

endclass
`endif