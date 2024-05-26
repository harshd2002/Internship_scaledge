////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_pred.sv
//description: predictor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO predictor class

`ifndef FIFO_PREDICTOR
`define FIFO_PREDICTOR

class fifo_pred;
	//object of transaction class to store data
	fifo_trans trans_h, exp_trans_h;
	//mailbox to get data from monitor
	mailbox #(fifo_trans) mon_pred_scrbd;
	//mailbox to pass data to scoreboard
	mailbox #(fifo_trans) pred_scrbd;
	//reference memory
 	bit [7:0] rf_ram [$:15];

	//connecting mailbox
	function void connect(mailbox #(fifo_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//converting pin level to transaction level
	task run();
    forever begin
    fork
    $display("predictor started");
    begin: predictor_b
		//getting inputs
		mon_pred_scrbd.peek(trans_h);
    object_raise();
		//shallow copy of object from monitor
		exp_trans_h = new trans_h;

		//passing expected data to scoreboard
    //$display($time, "predictor");
		pred_scrbd.put(exp_trans_h);
    trans_h.print_trans("predictcor");
    end
    /*begin: reset_b
      @(rst_evt)
      foreach(rf_ram[i])
        rf_ram[i] = 0;
    end*/
    join_any
    object_drop();
    end
	endtask
endclass
`endif
