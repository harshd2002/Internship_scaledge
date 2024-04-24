module ambiguous;
  reg [3:0] a, b, c;
  
  initial begin
    a = 4'b0101;
    b = 4'b1x1x;
    $display(" b : %b ",b);
    c = (b==4'd10) ? 4'b0101:4'b1100;
    $display(" c : %b ",c);
  
  end
endmodule
