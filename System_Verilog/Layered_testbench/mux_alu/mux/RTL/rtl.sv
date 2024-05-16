module mux(output reg[32:0]out,
           input [31:0]A,[31:0]B,[31:0]C,[31:0]D,[2:0]sel,
           input clk,rst);

  
  always@(posedge clk)begin
    if(rst)begin
      out='d0;
    end
    else begin
      case(sel)

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
          out = B  * B;
        end

        3'd5  : begin
          out = 'hffff & A;
        end

        3'd6  : begin
          out = 'h0000  & B;
        end

        3'd7  : begin
          out = 'dx;
        end
      endcase
    end
  end
endmodule
