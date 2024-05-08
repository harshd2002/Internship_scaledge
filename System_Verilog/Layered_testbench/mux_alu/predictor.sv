//RAM predictor class

class mem_pred;
	//object of transaction class to store data
	mem_trans trans_obj, exp_trans_obj;
	//mailbox to get data from monitor
	mailbox #(mem_trans) mon_pred_scrbd;
	//mailbox to pass data to scoreboard
	mailbox #(mem_trans) pred_scrbd;
	//reference memory
 	reg [7:0] rf_ram [0:255];

	//connecting mailbox
	function new(mailbox #(mem_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//converting pin level to transaction level
	task run();
		//getting inputs
		mon_pred_scrbd.peek(trans_obj);
		//shallow copy of object from monitor
		exp_trans_obj = new trans_obj;

		//reference model logic
		case(exp_trans_obj.ops_e)
			0: begin
				rf_ram[exp_trans_obj.wr_addr] = exp_trans_obj.wr_data;
			end
			1: begin
				exp_trans_obj.rd_data = rf_ram[exp_trans_obj.rd_addr];
			end
			2: begin
				exp_trans_obj.rd_data = rf_ram[exp_trans_obj.rd_addr];
				rf_ram[exp_trans_obj.wr_addr] = exp_trans_obj.wr_data;
			end
		endcase
		
		//passing expected data to scoreboard
		pred_scrbd.put(exp_trans_obj);
	endtask
endclass
