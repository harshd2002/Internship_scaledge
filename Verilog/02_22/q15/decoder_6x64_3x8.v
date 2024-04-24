module decoder_6x64_3x8(input decoder_en,
												input [5:0] decoder_in,
												output [63:0] decoder_out
												);

	wire [7:0] wire_dec;

	decoder_3x8 dec1( .enbl(decoder_en), .inp(decoder_in[5:3]), .out(wire_dec));

	genvar i;
	generate
		for(i=0;i<8;i=i+1) begin
			decoder_3x8 dec1( .enbl(wire_dec[i]), .inp(decoder_in[2:0]), .out(decoder_out[((i+1)*8 - 1) -: 8]));
		end
	endgenerate

endmodule

module decoder_3x8 (input enbl,
										input [2:0] inp,
										output reg [7:0] out
										);

	always @(*) begin
		if(enbl) begin
			out = 1 << inp;		
		end
		else
			out = 8'h00;
	end

endmodule
