////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen_inbet_rst.sv
//description: extended generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO extended generator class

`ifndef FIFO_GENERATOR_INBET_RST
`define FIFO_GENERATOR_INBET_RST

class fifo_gen_inbet_rst extends fifo_gen;

	//task to generate and store data
	task run();
    fork
    begin
      object_raise();
      $display($time, " :generator_full_flag");
      WR_COUNT = 3;
      RD_COUNT = 5;
      INBET_RST_TIME = 65;
  
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
      NUM_TRANS = 5;
      //writing inside fifo
  		repeat(NUM_TRANS) begin
        super.write_op();
        gen_drv.put(trans_h);
      end
      object_drop();
    end
    begin
      #INBET_RST_TIME;
      ->rst_evt;
    end
    join
	endtask

endclass
`endif



