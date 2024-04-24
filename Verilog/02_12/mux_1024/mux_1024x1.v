`timescale 1ns / 1ps

module mux_1024x1
	#(parameter size_i = 1024,
							size_s = 10)
	(input [size_i - 1:0] mux_in,
	 input [size_s - 1:0] mux_sel,
	 output mux_out
	);

	reg out_r;

	assign mux_out = out_r;

	always @(*) begin

	 	out_r = mux_in[mux_sel];

	end

endmodule
