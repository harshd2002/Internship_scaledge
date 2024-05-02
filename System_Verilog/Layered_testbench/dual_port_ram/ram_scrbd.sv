////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_scrbd.sv
//description: scoreboard class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM scoreboard class

`ifndef RAM_SCOREBOARD
`define RAM_SCOREBOARD

class mem_scrbd;
	//handle for expected and actual data
	mem_trans exp_trans_obj, act_trans_obj;
	//mailbox from monitor and predictor
	mailbox #(mem_trans) mon_pred_scrbd;
	mailbox #(mem_trans) pred_scrbd;

	//connecting mailbox
	function connect(mailbox #(mem_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//comparing outputs
	task run();
    forever begin
		mon_pred_scrbd.get(act_trans_obj);
		pred_scrbd.get(exp_trans_obj);
    //$display($time, "scoreboard");
		$display($time," : scoreboard expected: %0p", exp_trans_obj);
    exp_trans_obj.print_trans("scoreboard");
		$display($time," : scoreboard actual: %0p", act_trans_obj);
    act_trans_obj.print_trans("scoreboard");
		//scoreboard logic 
			if(exp_trans_obj.rd_data == act_trans_obj.rd_data)
				$display($time," :read pass");
			else
				$display($time, " :read fail");
    end
	endtask

endclass
`endif
