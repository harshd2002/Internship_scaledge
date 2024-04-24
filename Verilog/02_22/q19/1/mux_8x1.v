module mux_8x1 #(parameter N = 8) (
  input wire [N - 1'b1 : 0] in_i,
  input wire [$clog2(N) - 1'b1 : 0] select_i,

  output wire out_o
  );

  // driving the output
  reg o;
  assign out_o = o;

  always @(*) begin 
    o = in_i[select_i];
  end

endmodule
