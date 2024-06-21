////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_almostfull_flag.sv
//description: extended generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_ALMOSTFULL_FLAG
`define FIFO_GENERATOR_ALMOSTFULL_FLAG

class fifo_gen_almostfull_flag extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    $display($time, " :generator_full_flag");
    TRANS_LIM = 4;

    NUM_TRANS = 16;
    //writing inside fifo
		repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
    //#100;
    NUM_TRANS = 5;
    //reading form fifo
		repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    //#50;
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



