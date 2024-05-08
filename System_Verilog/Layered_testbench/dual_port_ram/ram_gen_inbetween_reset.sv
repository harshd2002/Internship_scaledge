////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM generator class

`ifndef RAM_GENERATOR_INBETWEEN_RESET
`define RAM_GENERATOR_INBETWEEN_RESET

class mem_gen_inbetween_reset extends mem_gen;

	randc bit [7:0] addr[$];

	//task to generate and store data
	task run();
    int i = 0;
    $display($time, " :generator_continuous_wr");
		trans_obj = new();
		repeat(num_itr) begin
		trans_obj.randomize() with {ops_e == WRITE;};
    addr.push_back(trans_obj.wr_addr);
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
    end
		repeat(num_itr) begin
		trans_obj.randomize() with {rd_addr == addr[i]; ops_e == READ;};
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    i++;
    @(item_done);
		end
    ->reset_done;
		repeat(num_itr) begin
		trans_obj.randomize() with {rd_addr == addr[0]; ops_e == READ;};
    addr.pop_front();
		gen_drv.put(trans_obj);
		$display($time," : generator: %0p", trans_obj);
    @(item_done);
    end
	endtask

endclass
`endif
