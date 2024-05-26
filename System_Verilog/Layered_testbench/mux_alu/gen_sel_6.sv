//generator extended class for select 6 check

class gen_sel_6 extends generator;

	virtual task run();
		  trans_h = new();
		  trans_h.randomize() with { B == 32'hFFFFFFFF; ops_e == MASK0_B; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
      trans_num = 50;
      repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with {ops_e == MASK0_B;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end
	endtask

endclass

