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

class fifo_gen_sanity extends fifo_gen;

	//task to generate and store data
	task run();
    $display($time, " :generator_sanity");
		//repeat(num_itr) begin
		//wait(item_done.triggered);
		  trans_h = new();
		  trans_h.randomize() with {ops_e == WRITE;};
      trans_h.wr_enbl = 1;
      trans_h.rd_enbl = 0;
		  wr_gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.ops_e = READ;
      trans_h.wr_enbl = 0;
      trans_h.rd_enbl = 1;
		  rd_gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
		//end
	endtask

endclass
`endif
