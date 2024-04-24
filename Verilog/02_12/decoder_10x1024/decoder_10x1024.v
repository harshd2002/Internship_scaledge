`timescale 1ns / 1ps

module decoder_10x1024 
	#(parameter IN = 10,
							OUT = 1024)
	(input wire enable,
	 input wire [IN-1:0] decoder_i,
	 output wire [OUT-1:0] decoder_o
	);
	
	reg [OUT-1:0] out_r;

	assign decoder_o = out_r;

	always @(*) begin

		if(enable) begin

			out_r = 1024'b0;
			out_r[decoder_i] = 1'b1;

		end
		else
			out_r = 1024'b0;

	end

endmodule
