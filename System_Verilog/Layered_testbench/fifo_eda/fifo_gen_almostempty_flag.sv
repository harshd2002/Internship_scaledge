////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_almostempty_flag.sv
//description: extended generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_ALMOSTEMPTY_FLAG
`define FIFO_GENERATOR_ALMOSTEMPTY_FLAG

class fifo_gen_almostempty_flag extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    $display($time, " :generator_almostempty_flag");
    WR_COUNT = 8;
    RD_COUNT = 8;

    NUM_TRANS = 8;
    //writing inside fifo
		repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    NUM_TRANS = 8;
    //reading form fifo
		repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    WR_COUNT = 5;
    NUM_TRANS = 5;
    //writing inside fifo
		repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    NUM_TRANS = 5;
    //reading form fifo
		repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    object_drop();
	endtask

endclass
`endif


