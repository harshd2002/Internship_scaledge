`timescale 1ns/1ps

module t_ff (
  input wire clk,
  input wire reset,
  input wire T,
  output wire Q
  );
  
  reg q;
  assign Q = q;

  always @(negedge clk) begin 
    if(!reset) 
      q <= 1'b0;
    else begin 
      if(T == 1'b1) 
        q <= ~q;
      else
        q <= q;
    end
  end
endmodule


module counter_t_ff #(parameter N = 3)
	(input wire clk_i,
  input wire T_i,
  input wire reset_i,

  output wire [N - 1'b1:0] Q_o
  );

  t_ff D0(.clk(clk_i),.reset(reset_i),.T(T_i),.Q(Q_o[0]));
  t_ff D1(.clk(Q_o[0]),.reset(reset_i),.T(T_i),.Q(Q_o[1]));
  t_ff D2(.clk(Q_o[1]),.reset(reset_i),.T(T_i),.Q(Q_o[2]));

endmodule
