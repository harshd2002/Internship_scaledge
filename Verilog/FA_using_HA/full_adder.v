`timescale 1ns / 1ps

module HA(input a,b,
          output s,
          output c
         );
 	assign s = a^b;
    assign c = a&b; 
  
endmodule

module FA(input a,b,cin,
          output s,c
         );
  
//   assign s = a^b^cin;
//   assign c = (a&b) + (b&cin) + (a&cin);
  
  
  wire [2:0] w;
  
  HA h1(a,b,w[0],w[1]);
  HA h2(w[0],cin,s,w[2]);
  or g1(c,w[1],w[2]);
  
  initial begin
    $monitor("a = %b, b = %b, cin = %b, s = %b, c = %b",a,b,cin,s,c);
  end
  
endmodule
