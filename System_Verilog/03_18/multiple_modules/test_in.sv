// Code your testbench here
// or browse Examples

module tb;
  
  reg a,b;
  wire s,c;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
  
  end
  
endmodule
