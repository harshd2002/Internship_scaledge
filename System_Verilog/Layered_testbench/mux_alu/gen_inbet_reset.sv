//generator extended class for inbetween reset

class gen_inbet_rstn extends generator;

	virtual task run();
    int i;
    fork
    begin
    repeat(trans_num) begin
		  trans_h = new();
		  trans_h.randomize(); 
		  gen_drv.put(trans_h);
		  $display($time," : generator: %0p", trans_h);
      trans_h.print_trans("generator");
      @(item_done);
      i++;
    end
    end
    begin
      $info("inbetwween reeset started");
      wait(i == 3)
      #RST_DEL;
      -> reset_evt;
    end
    join
      /*repeat(trans_num) begin
		    trans_h = new();
		    trans_h.randomize() with {ops_e == MASK0_B;};
		    gen_drv.put(trans_h);
		    $display($time," : generator: %0p", trans_h);
        trans_h.print_trans("generator");
        @(item_done);
      end*/
	endtask

endclass

