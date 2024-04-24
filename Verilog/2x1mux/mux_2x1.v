// Code your design here
`timescale 1ns/1ns

module mux_2x1(input x1,
               input x2,
               input s0,
               output y
                 );
  
  wire [2:0]w;
  reg y;
  
//   GATE LEVEL MODELLING
//   not g1(w[0],s0);
//   or g4(y,w[1],w[2]);
//   and g2(w[1],x1,w[0]);
//   and g3(w[2],x2,s0);
  
  
//   DATA FLOW MODELLING
//   assign y = s0?x2:x1;
  
  
//   BEHAVIOURAL MODELLING
  always @(x1, x2, s0) begin
    
    $monitor("x1 = %b, x2 = %b, s0 = %b, y = %b.\n ",x1,x2,s0,y);
  	
    if(s0)
      y = x2;
    else
      y = x1;
    
  end
endmodule
