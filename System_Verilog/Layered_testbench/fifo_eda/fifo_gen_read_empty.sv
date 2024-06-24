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
    RD_COUNT = 6;
    WR_COUNT = 2;
    override_flag = 1;
      super.write_op();
      gen_drv.put(trans_h);
    $display($time, " :generator_sanity");
    NUM_TRANS = 4;
    //reading from fifo
  	repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    NUM_TRANS = 5;
    //writing inside fifo
  	repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    //override_flag = 0;
    //reading form fifo
  	repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    object_drop();
	endtask

endclass
`endif

