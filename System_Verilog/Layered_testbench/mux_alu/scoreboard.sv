//RAM scoreboard class

class mem_scrbd;
	//handle for expected and actual data
	mem_trans exp_trans_obj, act_trans_obj;
	//mailbox from monitor and predictor
	mailbox #(mem_trans) mon_pred_scrbd;
	mailbox #(mem_trans) pred_scrbd;

	//connecting mailbox
	function new(mailbox #(mem_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//comparing outputs
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

endclass
