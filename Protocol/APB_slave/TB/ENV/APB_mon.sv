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

  //virtual interface
  virtual apb_intf vintf;

  //connecting mailbox and virtual interface
  function void connect(virtual apb_intf vintf,mailbox #(apb_trans) mon_scrbd, mon_pred);
    this.vintf = vintf;
    this.mon_scrbd = mon_scrbd;
    this.mon_pred = mon_pred;
  endfunction

  //run method
  task run;
    forever @(`MON_PATH) begin
      trans_h = new();
      trans_h.Paddr = `MON_PATH.Paddr;
      trans_h.Pwdata = `MON_PATH.Pwdata;
      mon_scrbd.put(trans_h);
      mon_pred.put(trans_h);
    end
  endtask
  
endclass

`endif
