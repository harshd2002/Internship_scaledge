//RAM monitor class

class mem_mon;
	//object of transaction class to store data
	mem_trans trans_obj;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(mem_trans) mon_pred_scrbd;
	//virtual interface to connect with original interface (mem_intf)
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function new(mailbox #(mem_trans) mon_pred_scrbd, virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.vintf = vintf;
	endfunction
	//converting pin level data into transaction level data
	task run();
		trans_obj = new();
		#21;
		//logic to generate transaction level data
		case({vintf.wr_enbl, vintf.rd_enbl})
			2'b10: begin
				trans_obj.ops = WRITE;
				trans_obj.wr_data = vintf.wr_data;
				trans_obj.rd_data = vintf.rd_data;
				trans_obj.wr_addr = vintf.wr_addr;
				trans_obj.rd_addr = vintf.rd_addr;
			end
			2'b01: begin
				trans_obj.ops = READ;
				trans_obj.wr_data = vintf.wr_data;
				trans_obj.rd_data = vintf.rd_data;
				trans_obj.wr_addr = vintf.wr_addr;
				trans_obj.rd_addr = vintf.rd_addr;
			end
			2'b11: begin
				trans_obj.ops = WRITE_READ;
				trans_obj.wr_data = vintf.wr_data;
				trans_obj.rd_data = vintf.rd_data;
				trans_obj.wr_addr = vintf.wr_addr;
				trans_obj.rd_addr = vintf.rd_addr;
			end
		endcase
		//storing data for scoreboard and oeredictor
		mon_pred_scrbd.put(trans_obj);
	endtask
	//printing data
	task print_mon();
		$display("---------------------------monitor--------------------");
		$display("Time\tName\t\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\twr_enbl\t\t%0d", $time, vintf.wr_enbl);
		$display("%0d\trd_enbl\t\t%0d", $time, vintf.rd_enbl);
		$display("%0d\twr_addr\t\t%0d", $time, vintf.wr_addr);
		$display("%0d\trd_addr\t\t%0d", $time, vintf.rd_addr);
		$display("%0d\twr_data\t\t%0d", $time, vintf.wr_data);
		$display("%0d\trd_data\t\t%0d", $time, vintf.rd_data);
		$display("-------------------------------------------------------");
	endtask
endclass
