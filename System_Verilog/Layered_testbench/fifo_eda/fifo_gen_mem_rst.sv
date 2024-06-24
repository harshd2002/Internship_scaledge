////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_mem_rst.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_MEM_RST
`define FIFO_GENERATOR_MEM_RST

class fifo_gen_mem_rst extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
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

