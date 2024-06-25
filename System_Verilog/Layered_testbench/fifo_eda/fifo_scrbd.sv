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
	fifo_trans exp_trans_h, trans_h;
	
  //reference memory
 	bit [7:0] rf_mem_q [$:15];
	
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
    fork
    begin
      reset_checker();
    end
    forever begin
		mon_pred_scrbd.get(trans_h);
    $info("scoreboard started");
    object_raise();
		$info($time," : scoreboard actual: %0p", trans_h);
    trans_h.print_trans("scoreboard");
    if(trans_h.ops_e == WRITE)
      rf_mem_q.push_back(trans_h.wr_data);
//      rf_mem_q = {rf_mem_q, trans_h.wr_data};
      $info($time, "[SCOREBOARD] %h, %h", trans_h.wr_data, rf_mem_q[$]);

/*		//scoreboard logic 
    fifo_input_cvg.sample();
    fifo_output_cvg.sample(trans_h.rd_data, trans_h.full, trans_h.empty, trans_h.almost_full, trans_h.almost_empty, trans_h.overflow, trans_h.underflow);
    foreach(trans_h.wr_data[i]) begin
      bits_toggle_check.sample(trans_h.wr_data[i]);
      bits_toggle_check.sample(trans_h.rd_data[i]);
    end
*/
    checker_run();
    object_drop();
    end
    join
	endtask

  task reset_checker();
    forever @(rst_evt) begin
      rf_mem_q.delete();
		  mon_pred_scrbd.get(trans_h);
      checker_run();
    end
  endtask

  //checker to compare output
  task checker_run();
    if(trans_h.ops_e == READ) begin
		  if(trans_h.rd_data == rf_mem_q[0])
		    $info("%0t: [SCOREBOARD] read pass: %0h, %0h", $time, trans_h.rd_data, rf_mem_q);
      else
        $error("%0t: [SCOREBOARD] read fail: %0h, %0h", $time, trans_h.rd_data, rf_mem_q);
      void'(rf_mem_q.pop_front());
    end
    if(((trans_h.full) && (rf_mem_q.size()==16)) || ((!trans_h.full) && (rf_mem_q.size()!=16)))
		  $info("%0t: [SCOREBOARD] full flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] full flag fail", $time);
    if(((trans_h.empty) && (rf_mem_q.size()==0)) || ((!trans_h.empty) && (rf_mem_q.size()!=0)))
		  $info("%0t: [SCOREBOARD] empty flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] empty flag fail", $time);
    if(((trans_h.almost_full) && (rf_mem_q.size()>=14 && rf_mem_q.size()<16)) || ((!trans_h.almost_full) && (rf_mem_q.size()<14 || rf_mem_q.size()==16)))
		  $info("%0t: [SCOREBOARD] almost_full flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] almost_full flag fail", $time);
    if(((trans_h.almost_empty) && (rf_mem_q.size()>=1 && rf_mem_q.size()<3)) || ((!trans_h.almost_empty) && (rf_mem_q.size()==0 || rf_mem_q.size()>2)))
		  $info("%0t: [SCOREBOARD] almost_empty flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] amost_empty flag fail", $time);
    if(((trans_h.overflow) && (trans_h.full) && (trans_h.ops_e==WRITE)) || ((!trans_h.overflow) && (!trans_h.full) || (trans_h.ops_e!=WRITE)))
		  $info("%0t: [SCOREBOARD] overflow flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] overflow flag fail", $time);
    if(((trans_h.underflow) && (trans_h.empty) && (trans_h.ops_e==READ)) || ((!trans_h.underflow) && (!trans_h.empty) || (trans_h.ops_e!=READ)))		  
      $info("%0t: [SCOREBOARD] underflow flag pass", $time);
    else
		  $error("%0t: [SCOREBOARD] underflow flag fail", $time);
  endtask


endclass
`endif
