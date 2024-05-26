//generator extended class for select 0 check

class gen_sel_0 extends generator;

	virtual task run();
		  trans_h = new();
		  trans_h.randomize() with { A == 32'h55555555; B == 32'hFFFFFFFF; ops_e == BIT_AND; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
		  trans_h = new();
		  trans_h.randomize() with { B == 32'hAAAAAAAA; A == 32'hFFFFFFFF; ops_e == BIT_AND; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
      trans_num = 25;
    repeat(trans_num) begin
		  trans_h = new();
		  trans_h.randomize() with {ops_e == BIT_AND;};
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
    end
	endtask

endclass

