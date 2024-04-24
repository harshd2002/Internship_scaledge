
module tb;
  
	reg x1,x2,s0;
	wire y;
 	integer delay = 100;
  
  mux_2x1 dut(x1, x2, s0, y);
  
  
initial begin
  
  $dumpfile("dump.vcd"); 
  $dumpvars(1);
  x1 = 1'b0;x2 = 1'b1;
  s0 = 1'b0;
  #10 s0=1'b1;
  #20 x1 = 1'b1;x2 = 1'b0;
  #10 s0 = 1'b0;
  #100 $finish; 
end
  
endmodule
