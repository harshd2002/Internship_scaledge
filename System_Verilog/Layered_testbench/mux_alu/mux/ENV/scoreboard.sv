class scoreboard;

  transaction trans_h;    //Transaction Class Handle for the Original values
  transaction trans_h_exp;//Transaction Class Handle for the Original values
  
  mailbox#(transaction)m2s;   //MailBOX from monitor to ScoreBOARD
  mailbox#(transaction)r2s;   //MailBOX from reference_model to ScoreBOARD



  function void connect(mailbox#(transaction)m2s,mailbox#(transaction)r2s);   //MailBOX being connection
    this.m2s=m2s;
    this.r2s=r2s;
  endfunction


//--------Run TASKS-----------
  task run();
    forever begin
      m2s.get(trans_h);   //Getting Original that comes from DUT
      $display("----At ScoreBOARD(Original Values)---");
      trans_h.print_trans();
      r2s.get(trans_h_exp); //Getting the Generated Value from Reference Model
      $display("----At ScoreBOARD(Generated Values)---");
      trans_h_exp.print_trans();



//-------------Comparision BLOCK-------------------------
      if(trans_h.out==trans_h_exp.out)begin
        $display("Values are Same : Results passed");
      end
      else begin
        $display("Values are failed : Results Failed");
      end
    end
  endtask


endclass
