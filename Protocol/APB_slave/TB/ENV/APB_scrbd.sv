////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB scoreboard class

`ifndef APB_SCOREBOARD
`define APB_SCOREBOARD

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
      act_trans_h.print_trans("SCOREBOARD");
      exp_trans_h.print_trans("SCOREBOARD");
      //checking queue for inorder scoreboard
      wait(exp_q.size() && act_q.size()) begin
        if(exp_q.pop_back() == act_q.pop_back())
          $info($time, " :read operation pass.");
        else
          $info($time, " :read operation fail.");
      end
    end
  endtask

endclass

`endif
