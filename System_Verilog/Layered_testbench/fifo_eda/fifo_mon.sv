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
	fifo_trans trans_h, wr_trans_h, rd_trans_h;
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
    wait(vintf.rstn);
		forever begin
		  trans_h = new();
      fork
        begin
          @(`RD_MON);
          if(`RD_MON.rd_enbl) begin
            $info($time," :read monitor started");  
            trans_h.ops_e   = READ;
            trans_h.rd_data = `RD_MON.rd_data;

            trans_h.full         = `RD_MON.full;
            trans_h.almost_full  = `RD_MON.almost_full;
            trans_h.overflow     = `RD_MON.overflow;
            trans_h.empty        = `RD_MON.empty;
            trans_h.almost_empty = `RD_MON.almost_empty;
            trans_h.underflow    = `RD_MON.underflow;

            trans_h.print_trans("monitor");
		        //storing data for scoreboard and predictor
		        mon_pred_scrbd.put(trans_h);
          end
        end
        begin
          @(`WR_MON);
          if(`WR_MON.wr_enbl) begin
            $info($time," :write monitor started");
            trans_h.ops_e   = WRITE;
	        	trans_h.wr_data = `WR_MON.wr_data;

            trans_h.full         = `WR_MON.full;
            trans_h.almost_full  = `WR_MON.almost_full;
            trans_h.overflow     = `WR_MON.overflow;
            trans_h.empty        = `WR_MON.empty;
            trans_h.almost_empty = `WR_MON.almost_empty;
            trans_h.underflow    = `WR_MON.underflow;

            trans_h.print_trans("monitor");
		        //storing data for scoreboard and predictor
		        mon_pred_scrbd.put(trans_h);
          end
        end
      join_any
      disable fork;
    end
	endtask
endclass
`endif
