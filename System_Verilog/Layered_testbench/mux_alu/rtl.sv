////////////////////////////////////////////////////////////////////////////////////////////////////
// Inputs - [31:0] A, [31:0] B, [31:0] C, [31:0] D, [3:0] Sel
// Output - [32:0] OUT
// When Sel=0 => Out = A & B;
// When Sel=1 => Out = A - B
// When Sel=2 => Out = A + B
// When Sel=3 => Out = A * A // you can program value A such a way out will be more thhat 32 bits
// When Sel=4 => Out = B * B
// When Sel=5 => Out = 'hFFFF & A
// When Sel=6 => Out =  'h0000 & B
// When Sel=7 => Out = Hit Invalid Bins
////////////////////////////////////////////////////////////////////////////////////////////////////

//RTL design

module mux(output reg[32:0]out,
           input [31:0]A,[31:0]B,[31:0]C,[31:0]D,[3:0]sel_i,
           input clk,rstn,enb
           );

always @(*) begin
  if(!rstn)begin
    out='d0;
  end
  else if(enb) begin
    case(sel_i)
      3'd0  : begin
        out = A & B;
      end
      3'd1  : begin
        out = A - B; 
      end
      3'd2  : begin
        out = A + B;
      end
      3'd3  : begin
        out = A * A;
      end
      3'd4  : begin
        out = B * B;
      end
      3'd5  : begin
        out = 'hffff & A;
      end
      3'd6  : begin
        out = 'h0000 & B;
      end
      3'd7  : begin
        out = 'd0;
      end
      default: begin
        out = 'd0;
      end
    endcase
  end
end
endmodule
