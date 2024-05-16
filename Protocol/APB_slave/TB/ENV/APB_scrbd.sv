////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB scoreboard class

`ifndef APB_PREDICTOR
`define APB_PREDICTOR

class apb_scrbd;
  //transaction class handle
  apb_trans act_trans_h, exp_trans_h;

  //mailbox to get data from monitor and predictor
  mailbox #(apb_trans) mon_scrbd;
  mailbox #(apb_trans) pred_scrbd;
  
  //connecting mailbox 
  function void connect(mailbox #(apb_trans) mon_scrbd, pred_scrbd);
    this.mon_scrbd = mon_scrbd;
    this.pred_scrbd = pred_scrbd;
  endfunction

  //run method
  task run;
    forever begin
      mon_scrbd.get(act_trans_h);
      pred_scrbd.get(exp_trans_h);
    end
  endtask

  
endclass

`endif
