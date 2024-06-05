////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB monitor class

`ifndef APB_MONITOR
`define APB_MONITOR

class apb_mon;
  //transaction class handle
  apb_trans trans_h;

  //mailbox to pass data to scoreboard and predictor
  mailbox #(apb_trans) mon_scrbd;
  mailbox #(apb_trans) mon_pred;
  mailbox #(apb_trans) mon_func_cvg;

  //virtual interface
  virtual apb_intf vintf;

  //connecting mailbox and virtual interface
  function void connect(virtual apb_intf vintf,mailbox #(apb_trans) mon_scrbd, mon_pred, mon_func_cvg);
    this.vintf = vintf;
    this.mon_scrbd = mon_scrbd;
    this.mon_pred = mon_pred;
    this.mon_func_cvg = mon_func_cvg;
  endfunction

  //run method
  task run;
    forever @(`MON_PATH) begin
      trans_h = new();
      wait(`MON_PATH.Psel && `MON_PATH.Penable && `MON_PATH.Pready) begin
        trans_h.Pwrite    = `MON_PATH.Pwrite;
        trans_h.Paddr     = `MON_PATH.Paddr;
        trans_h.Pwdata    = `MON_PATH.Pwdata;
        trans_h.Pready    = `MON_PATH.Pready;
        trans_h.Prdata    = `MON_PATH.Prdata;
        trans_h.Pslverr   = `MON_PATH.Pslverr;
        mon_scrbd.put(trans_h);
        mon_pred.put(trans_h);
        mon_func_cvg.put(trans_h);
        trans_h.print_trans("MONITOR");
        if(!`MON_PATH.Pwrite)
          act_q.push_front(trans_h.Prdata);
      end
    end
  endtask
  
endclass

`endif
