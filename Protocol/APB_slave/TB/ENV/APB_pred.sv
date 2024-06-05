////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB predictor class

`ifndef APB_PREDICTOR
`define APB_PREDICTOR

class apb_pred;
  //transaction class handle
  apb_trans trans_h, exp_trans_h;

  //mailbox to pass data to scoreboard and get from monitor
  mailbox #(apb_trans) mon_pred;
  mailbox #(apb_trans) pred_scrbd;
  
  //connecting mailbox 
  function void connect(mailbox #(apb_trans) mon_pred, pred_scrbd);
    this.mon_pred = mon_pred;
    this.pred_scrbd = pred_scrbd;
  endfunction

  //run method
  task run;
    forever begin
      mon_pred.get(trans_h);
      exp_trans_h = new trans_h;
      trans_h.print_trans("predictor");
      if(trans_h.Pwrite)
        exp_q.push_front(trans_h.Pwdata);
      if(trans_h.Paddr > 20)
        trans_h.Pslverr = 1;
      else
        trans_h.Pslverr = 0;

      pred_scrbd.put(exp_trans_h);
    end
  endtask

endclass

`endif
