//XOR4 using XOR2
`timescale 1ns / 1ps

module xor4_xor2 (input [3:0] inp,
									output out
									);

	wire [3:0] xor2_out;

	xor g1(xor2_out[0], inp[0], inp[1]);
	xor g2(xor2_out[1], inp[2], inp[3]);
	xor g3(out, xor2_out[0], xor2_out[1]);

endmodule
