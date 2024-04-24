`timescale 1ns / 1ps

module load_counter(input clk,
                    input rst,
                    input load,
                    input [3:0] din,
                    output [3:0] count
                   );
  
  reg [3:0] counter = 4'b0;
  
  assign count = counter;
  
  always @(posedge clk or negedge rst) begin
    
    if (!rst) begin
      counter = 1'b0;
    end
    else if(load) begin
      counter = din;
    end
    else begin
      counter = counter + 1;
    end
    
  end
  
endmodule
