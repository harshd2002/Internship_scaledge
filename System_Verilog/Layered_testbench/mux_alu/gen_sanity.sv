//generator extended class for sanity check

class gen_sanity extends generator;

	virtual task run();
    repeat(trans_num) begin
		  trans_h = new();
		  trans_h.randomize();
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
    end
	endtask

endclass

