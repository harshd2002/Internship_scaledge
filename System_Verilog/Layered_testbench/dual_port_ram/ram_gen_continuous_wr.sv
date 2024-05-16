////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR_CONTINUOUS_WR
`define RAM_GENERATOR_CONTINUOUS_WR

class mem_gen_continuous_wr extends mem_gen;

	randc bit [7:0] addr[$];

	//task to generate and store data
	task run();
    $display($time, " :generator_continuous_wr");
		trans_h = new();
		repeat(num_itr) begin
		trans_h.randomize() with {ops_e == WRITE;};
    addr.push_back(trans_h.wr_addr);
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
    end
		repeat(num_itr) begin
		trans_h.randomize() with {rd_addr == addr[0]; ops_e == READ;};
    addr.pop_front(); 
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
		end
		trans_h.randomize() with {wr_addr == rd_addr; ops_e == WRITE;};
    trans_h.rd_addr.rand_mode(0);
    trans_h.wr_addr.rand_mode(0);
		repeat(num_itr) begin
		trans_h.randomize() with {ops_e == WRITE;};
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
    end
		trans_h.randomize() with {ops_e == READ;};
		repeat(num_itr) begin
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    @(item_done);
    end
	endtask

endclass
`endif
