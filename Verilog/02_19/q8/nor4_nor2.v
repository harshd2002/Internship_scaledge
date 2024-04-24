//NOR4 using NOR2

`timescale 1ns / 1ps

module nor4_nor2 (input [3:0] inp,
									output out
									);
	
	wire [3:0] nor2_out;

	nor g1(nor2_out[0], inp[0], inp[1]);
	nor g2(nor2_out[1], inp[2], inp[3]);
	nor g3(nor2_out[2], nor2_out[0], nor2_out[0]);
	nor g4(nor2_out[3], nor2_out[1], nor2_out[1]);
	nor g5(out, nor2_out[2], nor2_out[3]);

endmodule
