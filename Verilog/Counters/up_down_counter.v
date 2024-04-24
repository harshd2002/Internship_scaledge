`timescale 10ns/1ps
module up_down_counter(
  input clk,
  input reset,
  input control,
  
  output reg [3:0] count
  );

always @(posedge clk) begin 

  if(reset)
    count = 4'd0;
  else begin 
    if(!control) 
      count = count + 1;
    else 
      count = count - 1;
  end
end

endmodule

