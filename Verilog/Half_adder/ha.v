module HA(input a,b,
          output s,
          output c
         );
  
//   GATE LEVEL MODELLING
//   xor g1(s, a, b);
//   and g2(c, a, b);
  
  reg s,c;
  
//   DATAFLOW MODELLING
//     assign s = a^b;
//     assign c = a&b; 
  
  
//   BEHAVIOURAL MODELLING
  always @(a, b) begin
    
    s = a^b;
    c = a&b;
    
    $monitor("a = %b,b = %b, sum = %b, carry = %b",a, b, s, c);
    
  end
  
endmodule
