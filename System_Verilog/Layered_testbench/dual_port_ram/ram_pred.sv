////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_pred.sv
//description: predictor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM predictor class

`ifndef RAM_PREDICTOR
`define RAM_PREDICTOR

class mem_pred;
	//object of transaction class to store data
	mem_trans trans_h, exp_trans_h;
	//mailbox to get data from monitor
	mailbox #(mem_trans) mon_pred;
	//mailbox to pass data to scoreboard
	mailbox #(mem_trans) pred_scrbd;
	//reference memory
 	bit [7:0] rf_ram [int ];

	//connecting mailbox
	function connect(mailbox #(mem_trans) mon_pred, pred_scrbd);
		this.mon_pred = mon_pred;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//converting pin level to transaction level
	task run();
    forever begin
    fork
    begin: reset_b
      @(reset_done)
      foreach(rf_ram[i])
        rf_ram[i] = 0;
    end
    begin: predictor_b
		//getting inputs
		mon_pred.get(trans_h);
		//shallow copy of object from monitor
		exp_trans_h = new trans_h;

		//reference model logic
		case(exp_trans_h.ops_e)
			1: begin
				rf_ram[exp_trans_h.wr_addr] = exp_trans_h.wr_data;
			end
			2: begin
				exp_trans_h.rd_data = rf_ram[exp_trans_h.rd_addr];
			end
			3: begin
				exp_trans_h.rd_data = rf_ram[exp_trans_h.rd_addr];
				rf_ram[exp_trans_h.wr_addr] = exp_trans_h.wr_data;
			end
		endcase
		
		//passing expected data to scoreboard
    //$display($time, "predictor");
		pred_scrbd.put(exp_trans_h);
    trans_h.print_trans("predictcor");
    end
    join_any
    disable fork;
    end
	endtask
endclass
`endif
