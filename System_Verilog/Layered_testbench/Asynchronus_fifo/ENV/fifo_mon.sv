////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project:
//File name:
//description: monitor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO monitor class

`ifndef FIFO_MONITOR
`define FIFO_MONITOR

class fifo_mon;
	//object of transaction class to store data
	fifo_trans wr_trans_h, rd_trans_h;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(fifo_trans) mon_pred_scrbd;
	//virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf vintf;

	//connecting mailbox and virtual interface
	function void connect(mailbox #(fifo_trans) mon_pred_scrbd, virtual fifo_intf vintf);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.vintf = vintf;
	endfunction
	
  //converting pin level data into transaction level data
	task run();
		forever begin
		trans_h = new();
    $display("monitor started");
		//logic to generate transaction level data
    fork
      $display("monitor started");
      begin: wr_mon_b
        @(`WR_MON);
        object_raise();
	    	trans_h.wr_enbl     = `WR_MON.wr_enbl;
	    	trans_h.wr_data     = `WR_MON.wr_data;
        trans_h.full        = `WR_MON.full;
        trans_h.almost_full = `WR_MON.almost_full;
        trans_h.overflow    = `WR_MON.overflow;
      end
      begin: rd_mon_b
        @(`RD_MON);
        object_raise();
		    trans_h.rd_enbl      = `RD_MON.rd_enbl;
        trans_h.rd_data      = `RD_MON.rd_data;
        trans_h.empty        = `RD_MON.empty;
        trans_h.almost_empty = `RD_MON.almost_empty;
        trans_h.underflow    = `RD_MON.underflow;
      end
    join_any
    disable fork;
    $cast(trans_h.ops_e,{`RD_MON.rd_enbl, `WR_MON.wr_enbl});
		//storing data for scoreboard and predictor
		mon_pred_scrbd.put(trans_h);
    trans_h.print_trans("monitor");
    object_drop();
    object_drop();
    end
	endtask
endclass
`endif
