////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR_BACKTOBACK_WR
`define RAM_GENERATOR_BACKTOBACK_WR

class mem_gen_backtoback_wr extends mem_gen;

	//task to generate and store data
	task run();
    $display($time, " :generator_backtoback_wr");
		trans_obj = new();
		repeat(num_itr) begin
		trans_obj.randomize() with {wr_addr==rd_addr; ops_e == WRITE;};
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
    trans_obj.ops_e = READ;
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
		end
	endtask

endclass
`endif
