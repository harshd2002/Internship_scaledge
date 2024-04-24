`timescale 1ns/1ps
module vending_machine_FSM(
  input clk,
  input reset,
  input wire [1:0] coin,
  output wire Product,
  output wire Change
  );

parameter NO_COIN = 3'd0,
          RS1     = 3'd1,
          RS2     = 3'd2,
          PRODUCT = 3'd3,
          CHANGE  = 3'd4;

parameter ONE = 2'd1,
          TWO = 2'd2;

reg pdt;
reg chg;
assign Product = pdt;
assign Change  = chg;

reg [2:0] present_state;

always @(posedge clk or negedge reset) begin 
  if(!reset) begin 
    present_state <= 3'd0;    
  end
  else begin 
    case(present_state) 
      NO_COIN : case(coin)
                  ONE : present_state <= RS1;
                  TWO : present_state <= RS2;
                  default : present_state <= present_state;
                endcase
      RS1 : case(coin)
              ONE : present_state <= RS2;
              TWO : present_state <= PRODUCT;
              default: present_state <= present_state;
            endcase

      RS2 : case(coin)
              ONE : present_state <= PRODUCT;
              TWO : present_state <= CHANGE;
            endcase
      PRODUCT : present_state <= NO_COIN; 
      CHANGE : present_state <= NO_COIN;
    endcase

  end
end

always @(present_state) begin 

  if(!reset) begin 
    pdt <= 1'b0;
    chg <= 1'b0;
  end
  else begin 
    case(present_state)
      NO_COIN,RS1,RS2:  begin pdt <= 1'b0;
                        chg <= 1'b0;
                        end
      PRODUCT: begin pdt <= 1'b1;
               chg <= 1'b0;
               end
      CHANGE: begin pdt <= 1'b1;
              chg <= 1'b1;
              end
  endcase
end
end
endmodule
