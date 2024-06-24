////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_continuous_wr_rd.sv
//description: extended generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_CONTINUOUS_WR_RD
`define FIFO_GENERATOR_CONTINUOUS_WR_RD

class fifo_gen_continuous_wr_rd extends fifo_gen;

	//task to generate and store data
	task run();
    object_raise();
    $display($time, " :generator_continuous_wr_rd");
    WR_COUNT = 10;
    RD_COUNT = 10;
    override_flag = 0;
		repeat(NUM_TRANS) begin
      super.write_op();
      gen_drv.put(trans_h);
    end
		repeat(NUM_TRANS) begin
      super.read_op();
      gen_drv.put(trans_h);
    end
    object_drop();
	endtask

endclass
`endif

