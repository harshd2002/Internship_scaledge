//generator extended class for select 3 check

class gen_sel_3 extends generator;

	virtual task run();
		  trans_h = new();
		  trans_h.randomize() with { A == 32'hFFFFFFFF; ops_e == SQ_A; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
		  trans_h = new();
		  trans_h.randomize() with { A == 32'h00000000; ops_e == SQ_A; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
      trans_num = 50;
      repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with {ops_e == SQ_A;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end
	endtask

endclass

