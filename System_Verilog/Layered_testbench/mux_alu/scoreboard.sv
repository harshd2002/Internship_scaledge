//scoreboard class

class scoreboard;
	//handle for expected and actual data
	transaction exp_trans_h, act_trans_h;
	//mailbox from monitor and predictor
	mailbox #(transaction) mon_pred_scrbd;
	mailbox #(transaction) pred_scrbd;

	//connecting mailbox
	function void connect(mailbox #(transaction) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//comparing outputs
	task run();
    forever begin
		  mon_pred_scrbd.get(act_trans_h);
		  pred_scrbd.get(exp_trans_h);
		  $display($time," : scoreboard expected: %0p", exp_trans_h);
      exp_trans_h.print_trans("scoreboard");
		  $display($time," : scoreboard actual: %0p", act_trans_h);
      act_trans_h.print_trans("scoreboard");
		  //scoreboard logic 
      checker_run();
    end
	endtask

  task checker_run();
      fork
      begin
		    wait(exp_trans_h.out == act_trans_h.out)
		  	  $display("%0t: read pass", $time);
      end
      begin
		    #TIME_OUT
		  	  $display("%0t: read fail", $time);
      end
      join_any
      disable fork;
  endtask

endclass
