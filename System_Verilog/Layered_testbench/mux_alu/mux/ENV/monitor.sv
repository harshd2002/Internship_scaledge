`ifndef MUX_MON_SV
`define MUX_MON_SV

`define MON vif.monitor_mtr
class monitor;
  
  transaction trans_h;  //Instance for the Transaction Class
  

  mailbox#(transaction)m2r;   //MailBOX for Monitor to Reference Model
  mailbox#(transaction)m2s;   //MailBOX for Monitor to ScoreBOARD Model

  virtual inf vif;    //Virtual Interface Handle
  

//-----------Connection BLOCK--------------
  function void connect(virtual inf vif,mailbox#(transaction)m2r,mailbox#(transaction)m2s);
    this.vif=vif;
    this.m2r=m2r;
    this.m2s=m2s;
  endfunction


//---------Run BLOCK-------
  task run();
    forever begin
    

    @(posedge vif.monitor_mtr);
      
      trans_h=new();
      trans_h.sel =  `MON.sel;
      trans_h.A =  `MON.A;
      trans_h.B =  `MON.B;
      trans_h.C =  `MON.C;
      trans_h.D =  `MON.D;
      trans_h.out =  `MON.out;
      

      $display("----------At Monitor--------------");
      trans_h.print_trans();
        
      m2r.put(trans_h);   //Loading the Values in the MailBOX of Reference_MODEL
      m2s.put(trans_h);   //Loading the Values in the MailBOX of Reference_MODEL   
      
    end
  endtask

endclass
`endif














      /*case(vif.sel)
        
        4'b0000:begin
          trans_h.sel=SEL_0;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end


        4'b0001:begin
          trans_h.sel=SEL_1;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end

        4'b0010:begin
          trans_h.sel=SEL_2;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end

        
        4'b0011:begin
          trans_h.sel=SEL_4;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end

        
        4'b0100:begin
          trans_h.sel=SEL_4;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end


        4'b0101:begin
          trans_h.sel=SEL_5;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end

    
        4'b0110:begin
          trans_h.sel=SEL_6;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end


        4'b0111:begin
          trans_h.sel=SEL_7;
          trans_h.A=vif.A;
          trans_h.B=vif.B;
        end

      endcase*/
