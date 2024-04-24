//RAM predictor class

class mem_pred;
	//object of transaction class to store data
	mem_trans trans_obj;
	//mailbox to get data from monitor
	mailbox #(mem_trans) mon_pred_scrbd;
	//mailbox to pass data to scoreboard
	mailbox #(mem_trans) pred_scrbd;
	//reference memory
 	reg [7:0] rf_ram [0:255];

	function new(mailbox #(mem_trans) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction
	task run();
		mon_pred_scrbd.peek(trans_obj);

		//reference model logic
		case(trans_obj.ops)
			0: begin
				 rf_ram[trans_obj.wr_addr] = trans_obj.wr_data;
			end
			1: begin
				trans_obj.rd_data = rf_ram[trans_obj.rd_addr];
			end
			2: begin
				trans_obj.rd_data = rf_ram[trans_obj.rd_addr];
				rf_ram[trans_obj.wr_addr] = trans_obj.wr_data;
			end
		endcase
		
		pred_scrbd.put(trans_obj);
	endtask
	//printing data
	task print_pred();
		$display("---------------------------predictor--------------------");
		$display("Time\tName\t\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\toperation\t\t%0s", $time, trans_obj.ops.name());
		$display("%0d\twr_addr\t\t%0d", $time, trans_obj.wr_addr);
		$display("%0d\trd_addr\t\t%0d", $time, trans_obj.rd_addr);
		$display("%0d\twr_data\t\t%0d", $time, trans_obj.wr_data);
		$display("%0d\trd_data\t\t%0d", $time, trans_obj.rd_data);
		$display("-------------------------------------------------------");
	endtask
endclass
