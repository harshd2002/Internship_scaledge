`timescale 1ns/100ps

module mux_2x1(input [1:0] x,
//             input x2,
               input s0,
               output y
              );
  
//   DATAFLOW MODELLING
  assign y = s0?x[1]:x[0];

endmodule

module mux_4x1(input a, b, c, d,
               input [1:0] s,
               output y
              );
  wire [1:0] w;
  
  mux_2x1 m1({b,a},s[0],w[0]);
  mux_2x1 m2({d,c},s[0],w[1]);
  mux_2x1 m3(w,s[1],y);
  
  initial begin
    $monitor("%d,\tX = %b, s = %b, Y = %b",$time, {a,b,c,d}, s, y);
  end
  
endmodule
