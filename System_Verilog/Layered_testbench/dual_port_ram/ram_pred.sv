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
	mem_trans trans_obj, exp_trans_obj;
	//mailbox to get data from monitor
	mailbox #(mem_trans) mon_pred_scrbd;
	//mailbox to pass data to scoreboard
	mailbox #(mem_trans) pred_scrbd;
	//reference memory
 	bit [7:0] rf_ram [0:255];

	//connecting mailbox
	function connect(mailbox #(mem_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//converting pin level to transaction level
	task run();
    forever begin
		//getting inputs
		mon_pred_scrbd.peek(trans_obj);
		//shallow copy of object from monitor
		exp_trans_obj = new trans_obj;

		//reference model logic
		case(exp_trans_obj.ops_e)
			0: begin
        exp_trans_obj.rd_data = 0;
        foreach(rf_ram[i])
				  rf_ram[i] = 0;
			end
			1: begin
				rf_ram[exp_trans_obj.wr_addr] = exp_trans_obj.wr_data;
			end
			2: begin
				exp_trans_obj.rd_data = rf_ram[exp_trans_obj.rd_addr];
			end
			3: begin
				exp_trans_obj.rd_data = rf_ram[exp_trans_obj.rd_addr];
				rf_ram[exp_trans_obj.wr_addr] = exp_trans_obj.wr_data;
			end
		endcase
		
		//passing expected data to scoreboard
    //$display($time, "predictor");
		pred_scrbd.put(exp_trans_obj);
    trans_obj.print_trans("predictcor");
    end
	endtask
endclass
`endif
