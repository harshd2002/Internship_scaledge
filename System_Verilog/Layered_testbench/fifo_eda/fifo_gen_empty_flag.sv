////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_empty_flag.sv
//description: extended generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_EMPTY_FLAG
`define FIFO_GENERATOR_EMPTY_FLAG

class fifo_gen_empty_flag extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    $display($time, " :generator_full_flag");
    WR_COUNT = 6;
    RD_COUNT = 8;

    NUM_TRANS = 8;
    //writing inside fifo
		repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    NUM_TRANS = 15;
    //reading form fifo
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
    object_drop();
	endtask

endclass
`endif


