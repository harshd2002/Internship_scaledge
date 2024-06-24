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
	fifo_trans trans_h;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(fifo_trans) mon_pred_scrbd;
  mailbox #(fifo_trans) mon_func_cvg;
	//virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf vintf;
  //handle to sample values to functional coverage class
  fifo_functional_cvg func_cvg_h;

	//connecting mailbox and virtual interface
	function void connect(mailbox #(fifo_trans) mon_pred_scrbd, mon_func_cvg,fifo_functional_cvg func_cvg_h, virtual fifo_intf vintf);
		this.mon_pred_scrbd = mon_pred_scrbd;
    this.mon_func_cvg   = mon_func_cvg;
		this.vintf          = vintf;
    this.func_cvg_h     = func_cvg_h;
	endfunction
	
  //converting pin level data into transaction level data
	task run();
    wait(vintf.rstn);
		forever begin
		  trans_h = new();
      fork
        wr_mon();
        rd_mon();
      join
    end
	endtask

  task wr_mon();
    forever @(`WR_MON) begin
      if(`WR_MON.wr_enbl) begin
        $display($time, " :[monitor] write enable detected");
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
        mon_func_cvg.put(trans_h);
        func_cvg_h.fifo_input_cvg.sample(trans_h);
        func_cvg_h.fifo_output_cvg.sample(trans_h.rd_data, trans_h.full, trans_h.empty, trans_h.almost_full, trans_h.almost_empty, trans_h.overflow, trans_h.underflow);
        foreach(trans_h.wr_data[i]) begin
          func_cvg_h.bits_toggle_check.sample(trans_h.wr_data[i]);
          func_cvg_h.bits_toggle_check.sample(trans_h.rd_data[i]);
        end
      end
    end
  endtask

  task rd_mon();
    forever @(`RD_MON) begin
      if(`RD_MON.rd_enbl) begin
      $display($time, " :[monitor] read enable detected");
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
        mon_func_cvg.put(trans_h);
        func_cvg_h.fifo_input_cvg.sample(trans_h);
        func_cvg_h.fifo_output_cvg.sample(trans_h.rd_data, trans_h.full, trans_h.empty, trans_h.almost_full, trans_h.almost_empty, trans_h.overflow, trans_h.underflow);
        foreach(trans_h.wr_data[i]) begin
          func_cvg_h.bits_toggle_check.sample(trans_h.wr_data[i]);
          func_cvg_h.bits_toggle_check.sample(trans_h.rd_data[i]);
        end
      end
    end
  endtask

endclass
`endif
