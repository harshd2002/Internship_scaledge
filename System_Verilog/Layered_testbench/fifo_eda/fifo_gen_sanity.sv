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
    object_raise();
    WR_COUNT = 1;
    RD_COUNT = 1;
    $display($time, " :generator_sanity");
    //writing inside fifo
    super.write_op();
    gen_drv.put(trans_h);
    //reading form fifo
    super.read_op();
    gen_drv.put(trans_h);
    object_drop();
	endtask

endclass
`endif
