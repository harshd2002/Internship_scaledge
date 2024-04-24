// Code your design here
`timescale 1ns / 1ps

module intra();
  reg a, b;
  
  initial begin
  a = 0;
  forever #0.5 a=~a;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    #200
    $finish;
  end
  
endmodule
