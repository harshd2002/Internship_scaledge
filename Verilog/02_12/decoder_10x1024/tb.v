// 

module tb;

	reg enbl;
	reg [9:0] inp;
	wire [1023:0] out;
	integer i;

	decoder_10x1024 dut(.enable(enbl), .decoder_i(inp), .decoder_o(out));

	initial	 begin

		enbl = 1'b0;
		inp = 10'b0;
		#10;
		enbl = 1'b1;

		for(i=0; i<1024; i=i+1'b1) begin

			inp = i;
			#2;

		end

	end

	initial begin

		$dumpfile("dump.vcd");
		$dumpvars;

	end

endmodule
