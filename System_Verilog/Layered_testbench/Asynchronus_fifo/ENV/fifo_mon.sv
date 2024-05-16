////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project:
//File name:
//description: monitor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO monitor class

`ifndef FIFO_WR_MONITOR
`define FIFO_WR_MONITOR

class fifo_wr_mon;
	//object of transaction class to store data
	fifo_trans trans_obj;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(fifo_trans) wr_mon_pred_scrbd;
	//virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function connect(mailbox #(fifo_trans) wr_mon_pred_scrbd, virtual fifo_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.wr_mon_pred_scrbd = wr_mon_pred_scrbd;
		this.vintf = vintf;
	endfunction
	//converting pin level data into transaction level data
	task run();
		forever @(vintf.fifo_cb_wr_mon) begin
		trans_obj = new();
		//logic to generate transaction level data
		trans_obj.wr_enbl = vintf.fifo_cb_wr_mon.wr_enbl;
		trans_obj.wr_data = vintf.fifo_cb_wr_mon.wr_data;
		trans_obj.wr_addr = vintf.fifo_cb_wr_mon.wr_addr;
		case({vintf.fifo_cb_wr_mon.wr_enbl, vintf.fifo_cb_wr_mon.rd_enbl})
			2'b10: begin
				trans_obj.ops_e = WRITE;
			end
			2'b11: begin
				trans_obj.ops_e = WRITE_READ;
			end
      default
		endcase
		//storing data for scoreboard and oeredictor
		wr_mon_pred_scrbd.put(trans_obj);
    //$display($time, "monitor");
    trans_obj.print_trans("monitor");
    end
	endtask
endclass
`endif
