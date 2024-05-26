////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_scrbd.sv
//description: scoreboard class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//FIFO scoreboard class

`ifndef ASYNC_FIFO_SCOREBOARD
`define ASYNC_FIFO_SCOREBOARD

class fifo_scrbd;
	//handle for expected and actual data
	fifo_trans exp_trans_h, act_trans_h;
	//mailbox from monitor and predictor
	mailbox #(fifo_trans) mon_pred_scrbd;
	mailbox #(fifo_trans) pred_scrbd;

	//connecting mailbox
	function void connect(mailbox #(fifo_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//comparing outputs
	task run();
    forever begin
    $display("scoreboard started");
		mon_pred_scrbd.get(act_trans_h);
		pred_scrbd.get(exp_trans_h);
    object_raise();
    //$display($time, "scoreboard");
		$display($time," : scoreboard expected: %0p", exp_trans_h);
    exp_trans_h.print_trans("scoreboard");
		$display($time," : scoreboard actual: %0p", act_trans_h);
    act_trans_h.print_trans("scoreboard");
		//scoreboard logic 
    checker_run();
    object_drop();
    end
	endtask

  task checker_run();
      fork
        begin
		      wait(exp_trans_h.rd_data == act_trans_h.rd_data);
		        if(act_trans_h.rd_enbl || act_trans_h.wr_enbl)
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
`endif
