
 class ram_lrng_data_xtn extends ram_gen;
 
 
    virtual task run_phase();
	 repeat(no_of_trans) begin
		trns = new();
		if(!trns.randomize() with {wr_data < 100;} ) 
		$error("Randomization Failed");
		super.put_trans_and_wait_for_ack();
	  end
	endtask
	
  endclass