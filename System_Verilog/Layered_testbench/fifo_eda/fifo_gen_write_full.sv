////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_write_full.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_WRITE_FULL
`define FIFO_GENERATOR_WRITE_FULL

class fifo_gen_write_full extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    $display($time, " :generator_write_full");
    RD_COUNT = 1;
    WR_COUNT = 5;
    override_flag = 1;
    NUM_TRANS = 20;
    /writing inside fifo
  	repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    //reading from fifo
  	repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    object_drop();
	endtask

endclass
`endif


