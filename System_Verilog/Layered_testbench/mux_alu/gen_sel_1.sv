//generator extended class for select 1 check

class gen_sel_1 extends generator;

	virtual task run();
		  trans_h = new();
		  trans_h.randomize() with { A == 32'hFFFFFFFF; B == 32'hFFFFFFFF; ops_e == SUB; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
		  trans_h = new();
		  trans_h.randomize() with { B == 32'h00000000; A == 32'hFFFFFFFF; ops_e == SUB; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
		  trans_h = new();
		  trans_h.randomize() with { A == 32'h00000000; B == 32'hFFFFFFFF; ops_e == SUB; };
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
      trans_num = 25;
      repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with { A > B; ops_e == SUB;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end
      repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with { A < B; ops_e == SUB;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end
      repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with {ops_e == SUB;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end
	endtask

endclass

