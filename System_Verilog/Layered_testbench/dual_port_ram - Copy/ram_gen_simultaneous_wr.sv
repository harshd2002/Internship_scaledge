////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR_SIMULTANEOUS_WR
`define RAM_GENERATOR_SIMULTANEOUS_WR

class mem_gen_simultaneous_wr extends mem_gen;

	//task to generate and store data
	task run();
    $display($time, " :generator_simultaneous_wr");
		trans_obj = new();
		repeat(num_itr) begin
		trans_obj.randomize() with {wr_addr==rd_addr; ops_e == WRITE_READ;};
    trans_obj.rd_addr.rand_mode(0);
    trans_obj.wr_addr.rand_mode(0);
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
    end
    trans_obj.wr_addr.rand_mode(1);
    trans_obj.rd_addr.rand_mode(0);
    num_itr = 256;
		repeat(num_itr) begin
    trans_obj.rd_addr = trans_obj.wr_addr;
		trans_obj.randomize() with {ops_e == WRITE_READ;};
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
		end
	endtask

endclass
`endif
