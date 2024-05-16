////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_mon.sv
//description: monitor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM monitor class

`ifndef RAM_MONITOR
`define RAM_MONITOR

class mem_mon;
	//object of transaction class to store data
	mem_trans trans_h;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(mem_trans) mon_pred;
	mailbox #(mem_trans) mon_scrbd;
	//virtual interface to connect with original interface (mem_intf)
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function connect(mailbox #(mem_trans) mon_pred, mon_scrbd, virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.mon_pred = mon_pred;
		this.mon_scrbd = mon_scrbd;
		this.vintf = vintf;
	endfunction
	//converting pin level data into transaction level data
	task run();
		forever @(vintf.mem_cb_mon) begin
		trans_h = new();
		//logic to generate transaction level data
		trans_h.wr_enbl = vintf.mem_cb_mon.wr_enbl;
		trans_h.rd_enbl = vintf.mem_cb_mon.rd_enbl;
		trans_h.wr_data = vintf.mem_cb_mon.wr_data;
		trans_h.rd_data = vintf.mem_cb_mon.rd_data;
		trans_h.wr_addr = vintf.mem_cb_mon.wr_addr;
		trans_h.rd_addr = vintf.mem_cb_mon.rd_addr;
    $cast(trans_h.ops_e,{trans_h.rd_enbl, trans_h.wr_enbl});

		/*case({vintf.mem_cb_mon.wr_enbl, vintf.mem_cb_mon.rd_enbl})
			2'b10: begin
				trans_h.ops_e = WRITE;
			end
			2'b01: begin
				trans_h.ops_e = READ;
			end
			2'b11: begin
				trans_h.ops_e = WRITE_READ;
			end
		endcase*/
		//storing data for scoreboard and predictor
		mon_pred.put(trans_h);
		mon_scrbd.put(trans_h);
    //$display($time, "monitor");
    trans_h.print_trans("monitor");
    end
	endtask
endclass
`endif
