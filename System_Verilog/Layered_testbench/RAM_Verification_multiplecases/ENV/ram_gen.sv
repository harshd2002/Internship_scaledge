`ifndef RAM_GEN_SV
`define RAM_GEN_SV
import ram::*;
virtual class ram_gen;
	//instance of transaction class
	protected ram_trans trns;
	//no of transaction to be performed
	int notrans=1;
	//mailbox to driver
	local mailbox #(ram_trans) gen_drv;

	//event
	local event drv;
	//connection to driver
	//function new(mailbox #(ram_trans) gen_drv);
	//	this.gen_drv = gen_drv;
	//endfunction

	virtual function void connect(mailbox #(ram_trans) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//randomize the transaction class and put in the mailbox
	pure virtual task run_phase();
		/*repeat(notrans) begin
	
		$display("GENERATOR..... %0t",$time);
		trns = new();
		if(!trns.randomize() with {wr_data < 100;} ) 
		   $error("Randomization Failed");
		gen_drv.put(trns);
		trns.print_info("GENERATOR");
		@(item_done);
		$display("Putting again GENNNN");

		end*/
	//endtask
	
	protected task put_trans_and_wait_for_ack();
	  gen_drv.put(trns);
	  @(item_done);
	endtask
	

endclass
`endif
