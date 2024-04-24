module tb`();
  parameter N = 8;
  reg [N - 1'b1 : 0] in;
  reg [$clog2(N) - 1'b1 : 0] select;

  wire out;

  mux_8x1 dut(
    .in_i(in),
    .select_i(select),
    .out_o(out)
    );

  reg [$clog2(N) - 1'b1 : 0] i;
  initial begin 
    in = {{N - 1'b1{1'b0}},1'b1};
		#2;
    for(i = 1; i < N ; i = i + 1'b1) begin 
			in = {~in[N - 2'd2:0],~in[N - 1'b1]};
			#2;
    end
  end

endmodule
