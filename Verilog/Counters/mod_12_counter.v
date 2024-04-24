`timescale 10ns/1ps

module up_down_mod_12_counter(
  input clk,
  input reset,
  input control,
  
  output reg [3:0] count
  );
wire clear;
assign clear = (count == 4'd11) ? 1'd1 : 1'd0;

always @(posedge clk) begin 

  if(reset) 
    count = 4'd0;
  else begin 
    if(!clear) begin 
      if(!control) 
       count = count + 1;
     else 
      count = count - 1;
    end
    else 
      count = 0;
  end
end

endmodule

