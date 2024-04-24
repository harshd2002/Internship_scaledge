`timescale 10ns/1ps

module up_down_mod_12_counter_tb();

reg clk;
reg reset;
reg control;

wire [3:0] count;

up_down_mod_12_counter dut(
  .clk(clk),
  .reset(reset),
  .control(control),
  .count(count)
  );

always begin #5 clk = ~clk; end

initial begin 
clk = 0;
reset = 1;
control = 0;

#10; 
reset = 0;
#180 
control = 1;
end




endmodule
