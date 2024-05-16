//generator extended class for sanity check

class gen_sanity extends generator;

	//task to generate and store data
	virtual task run();
		trans_h = new();
		trans_h.randomize();
    trans_h.enb = 1;
		gen_drv.put(trans_h);
		$display($time," : generator: %0p", trans_h);
    trans_h.print_trans("generator");
    @(item_done);
	endtask

endclass

