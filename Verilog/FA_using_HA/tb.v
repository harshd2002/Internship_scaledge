module tb;
  
  reg a,b,cin;
  wire s,c;
  
  FA dut(a,b,cin,s,c);
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a=0; b=0; cin=0;
    #10 
    b=1;
    #10 
    a=1; b=0;
    #10 
    b=1;
    #10 
    a=0; b=0; cin=1;
    #10 
    b=1;
    #10 
    a=1; b=0;
    #10 
    b=1;
    
  end
  
endmodule
