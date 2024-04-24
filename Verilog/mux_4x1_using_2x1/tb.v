module tb;
  
  reg a,b,c,d;
  reg [1:0]s;
  wire y;
  integer delay = 100;
  
  mux_4x1 dut(a,b,c,d, s, y);
  
  
initial begin
  
  $dumpfile("dump.vcd"); 
  $dumpvars;
  {a,b,c,d} = 4'b0111;
  s = 2'b00;#10
  {a,b,c,d} = 4'b0100;
  s = 2'b01;#10
  {a,b,c,d} = 4'b1101;
  s = 2'b10;#10
  {a,b,c,d} = 4'b0001;
  s = 2'b11;
  #100 $finish; 
end
  
endmodule
