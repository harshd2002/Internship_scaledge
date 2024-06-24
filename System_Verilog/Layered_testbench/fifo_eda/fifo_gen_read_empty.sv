////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_read_empty.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_READ_EMPTY
`define FIFO_GENERATOR_READ_EMPTY

class fifo_gen_read_empty extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    override_flag = 1;
    RD_COUNT = 1;
    WR_COUNT = 4;
    TRANS_LIM = 3;
    $display($time, " :generator_sanity");
    //reading from fifo
    super.read_op();
    gen_drv.put(trans_h);
    NUM_TRANS = 5;
    //writing inside fifo
  	repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    override_flag = 0;
    //reading form fifo
  	repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    object_drop();
	endtask

endclass
`endif

