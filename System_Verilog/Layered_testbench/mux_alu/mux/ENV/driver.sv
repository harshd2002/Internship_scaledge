`ifndef MUX_DRIV_SV
`define MUX_DRIV_SV

`define DRIV vif.driver_dv
class driver;
  
  transaction trans_h;
  
  mailbox#(transaction)g2d;
  
  virtual inf vif;
  
  function void connect(virtual inf vif,mailbox#(transaction)g2d);
    this.vif=vif;
    this.g2d=g2d;
  endfunction

  task run();
    
    forever begin


      if(vif.rst)begin
        $display("Reset Provided  , time  : %t",$time);
        `DRIV.A<='d0;
        `DRIV.B<='d0;
        `DRIV.C<='d0;
        `DRIV.D<='d0;
        `DRIV.sel<='d0;
      wait(!vif.rst);
        $display("Reset Ended ,time : %t",$time);
          ->item_done;
      end

      else begin

      g2d.get(trans_h);
      $display("-------At DRIVER---------");
      trans_h.print_trans();

      @(posedge vif.driver_dv);
      
      `DRIV.sel <=  trans_h.sel;
      `DRIV.A <=  trans_h.A;
      `DRIV.B <=  trans_h.B;
      `DRIV.C <=  trans_h.C;
      `DRIV.D <=  trans_h.D;
      
    ->item_done;
    end

    end
  endtask

endclass
`endif


















/*
      case(selc_line)
        
        3'b000:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end


        3'b001:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end

        3'b010:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end

        
        3'b011:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end

        
        3'b100:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end


        3'b101:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end

    
        3'b110:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end


        3'b111:begin
          vif.sel=3'b000;
          vif.A=trans_h.A;
          vif.B=trans_h.B;
        end



      endcase*/
