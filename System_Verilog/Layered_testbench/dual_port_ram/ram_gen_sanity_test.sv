////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR_SANITY
`define RAM_GENERATOR_SANITY

class mem_gen_sanity_test extends mem_gen;

	//task to generate and store data
	task run();
    $display($time, " :generator_sanity_test");
		//repeat(num_itr) begin
		//wait(item_done.triggered);
		trans_h = new();
		trans_h.randomize() with {wr_addr==rd_addr; ops_e == WRITE;};
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
    trans_h.ops_e = READ;
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
		//end
	endtask

endclass
`endif
