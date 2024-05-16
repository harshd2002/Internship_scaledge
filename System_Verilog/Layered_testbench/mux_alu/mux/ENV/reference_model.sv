class reference_model;
  


  transaction trans_h=new();
  transaction trans_h_exp=new();
  
  mailbox#(transaction)m2r;   //MailBOX from monitor to the Reference Model
  mailbox#(transaction)r2s;   //MailBOX from reference to the ScoreBoard



  function void connect(mailbox#(transaction)m2r,mailbox#(transaction)r2s);
    this.m2r=m2r;
    this.r2s=r2s;
  endfunction


  task run();
    forever begin
      m2r.get(trans_h);   //Getting the Data from the MailBOX
      $display("-----At Reference Model(Before Comparision)-----");
      trans_h.print_trans();


      case(trans_h.selc)    //Case Selection Based on the Property
       
       SEL_0  : begin    //When we have kept Selection Line as 0
        trans_h_exp.A=trans_h.A;
        trans_h_exp.B=trans_h.B;
        trans_h_exp.out=trans_h.A & trans_h.B;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
        
       SEL_1  : begin     //When we have kept Selection Line as 1
        trans_h_exp.A=trans_h.A;
        trans_h_exp.B=trans_h.B;
        trans_h_exp.out=trans_h.A - trans_h.B;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
        
       SEL_2  : begin     //When we have kept Selection Line as 2
        trans_h_exp.A=trans_h.A;
        trans_h_exp.B=trans_h.B;
        trans_h_exp.out=trans_h.A + trans_h.B;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
       
       SEL_3  : begin   //When we have kept Selection Line as 3
        trans_h_exp.A=trans_h.A;
        trans_h_exp.out=trans_h.A * trans_h.A;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end


       SEL_4  : begin   //When we have kept Selection Line as 4
        trans_h_exp.B=trans_h.B;
        trans_h_exp.out=trans_h.B * trans_h.B;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
       
       SEL_5  : begin   //When we have kept Selection Line as 5
        trans_h_exp.A=trans_h.A;
        trans_h_exp.out='hffff & trans_h.A;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end

       SEL_6  : begin   //When we have kept Selection Line as 6
        trans_h_exp.B=trans_h.B;
        trans_h_exp.out='h0000 & trans_h.B;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
       
       SEL_7  : begin   //When we have kept Selection Line as 7
        trans_h_exp.out='hxxxx;

        r2s.put(trans_h_exp);
        $display("-----At Reference Model(After Comparision)-----");
        trans_h_exp.print_trans();
       end
     endcase
    end
  endtask
endclass
