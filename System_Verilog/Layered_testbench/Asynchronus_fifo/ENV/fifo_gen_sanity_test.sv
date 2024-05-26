////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_sanity_test.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_SANITY
`define FIFO_GENERATOR_SANITY

class fifo_gen_sanity_test extends fifo_gen;

	//task to generate and store data
	task run();
    $display($time, " :generator_sanity_test");
		//repeat(num_itr) begin
		//wait(item_done.triggered);
		trans_obj = new();
		trans_obj.randomize() with {ops_e == WRITE;};
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
    trans_obj.ops_e = READ;
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
		//end
	endtask

endclass
`endif