//RAM scoreboard class

class mem_scrbd;
	mem_trans exp_trans_obj, act_trans_obj;
	mailbox #(mem_trans) mon_pred_scrbd;
	mailbox #(mem_trans) pred_scrbd;
	function new(mailbox #(mem_trans) mon_pred_scrbd, mailbox #(mem_trans) pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction
	task run();
		mon_pred_scrbd.get(act_trans_obj);
		pred_scrbd.get(exp_trans_obj);
		$display($time," : scoreboard expected: %0p", exp_trans_obj);
		$display($time," : scoreboard actual: %0p", act_trans_obj);
		//scoreboard logic 
			if(exp_trans_obj.rd_data == act_trans_obj.rd_data)
				$display("read pass");
			else
				$display("read fail");
	endtask
	//printing data
	task print_scrbd();
		$display("---------------------------scoreboard--------------------");
		$display("Time\tName\t\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\toperation\t\t%0s", $time, act_trans_obj.ops.name());
		$display("%0d\trd_addr\t\t%0d", $time, act_trans_obj.rd_addr);
		$display("%0d\tactual rd_data\t\t%0d", $time, act_trans_obj.wr_data);
		$display("%0d\texpected rd_data\t\t%0d", $time, exp_trans_obj.rd_data);
		$display("-------------------------------------------------------");
	endtask
endclass
