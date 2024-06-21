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
    forever begin
		mon_pred_scrbd.get(trans_h);
    $info("scoreboard started");
    object_raise();
		$info($time," : scoreboard actual: %0p", trans_h);
    trans_h.print_trans("scoreboard");
    if(trans_h.ops_e == WRITE)
      rf_mem_q.push_back(trans_h.wr_data);

		//scoreboard logic 
    fifo_input_cvg.sample();
    fifo_output_cvg.sample(trans_h.rd_data, trans_h.full, trans_h.empty, trans_h.almost_full, trans_h.almost_empty, trans_h.overflow, trans_h.underflow);
    foreach(trans_h.wr_data[i]) begin
      bits_toggle_check.sample(trans_h.wr_data[i]);
      bits_toggle_check.sample(trans_h.rd_data[i]);
    end

    checker_run();
    object_drop();
    end
	endtask

  //checker to compare output
  task checker_run();
    if(trans_h.ops_e == READ) begin
		  if(trans_h.rd_data == rf_mem_q[0])
		    $info("%0t: [SCOREBOARD] read pass", $time);
      else
        $error("%0t: [SCOREBOARD] read fail", $time);
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


  //------------------------------functonal coverage---------------------------------------------------

  //functional coverage for inputs
  covergroup fifo_input_cvg;
    option.comment      = "cover_group for input signals of Async FIFO";
    
    OPERATION: coverpoint trans_h.ops_e {
      option.comment = "operatin check";
      bins operation_write = {WRITE};
      bins operation_read = {READ};
    }
    OPE_TRANSITION: coverpoint trans_h.ops_e {
      option.comment = "operation transition check";
      bins back_to_back = (WRITE=>READ);
    }

    WRITE_DATA: coverpoint trans_h.wr_data {
      option.comment = "write data range check";
      bins write_data_range[4] = {[0:$]};
    }
  endgroup

  //coverage for toggle check
  covergroup bits_toggle_check with function sample (bit toggle_bit);
    option.comment = "covergroup to check toggle of bits";
    TOGGLE: coverpoint toggle_bit {
      bins bit_transition_0_1 = (0=>1);
      bins bit_transition_1_0 = (1=>0);
    }
  endgroup

  //coverage for output signals
  covergroup fifo_output_cvg with function sample(bit [7:0] read_data, bit full, empty, almostfull, almostempty, overflow,underflow);
    option.comment = "cover_group for output signals of Async FIFO";

    READ_DATA: coverpoint read_data {
      option.comment = "read data range check";
      bins read_data_range[4] = {[0:$]};
    }

    FULL_FLAG: coverpoint full {
      option.comment = "full flag transition check";
      bins full_transition_0_1 = (0=>1);
      bins full_transition_1_0 = (1=>0);
    }
    EMPTY_FLAG: coverpoint empty {
      option.comment = "empty flag transition check";
      bins empty_transition_0_1 = (0=>1);
      bins empty_transition_1_0 = (1=>0);
    }
    ALMOSTFULL_FLAG: coverpoint almostfull {
      option.comment = "almostfull flag transition check";
      bins almostfull_transition_0_1 = (0=>1);
      bins almostfull_transition_1_0 = (1=>0);
    }
    ALMOSTEMPTY_FLAG: coverpoint almostempty {
      option.comment = "almostempty flag transition check";
      bins almostempty_transition_0_1 = (0=>1);
      bins almostempty_transition_1_0 = (1=>0);
    }
    OVERFLOW_FLAG: coverpoint overflow {
      option.comment = "overflow flag transition check";
      bins overflow_transition_0_1 = (0=>1);
      bins overflow_transition_1_0 = (1=>0);
    }
    UNDERFLOW_FLAG: coverpoint underflow {
      option.comment = "underflow flag transition check";
      bins underflow_transition_0_1 = (0=>1);
      bins underflow_transition_1_0 = (1=>0);
    }
  endgroup

  function new();
    fifo_input_cvg    = new();
    fifo_output_cvg   = new();
    bits_toggle_check = new();
  endfunction

endclass
`endif
