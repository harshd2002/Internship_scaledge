module tb;

	reg [1023:0] inp;
	reg [9:0] sel;
	wire out;
	integer i;

	mux_1024x1 dut( .mux_in(inp), .mux_sel(sel), .mux_out(out));

	initial begin

		inp = 1024'b1;

		for (i=0; i<1024; i=i+1) begin
			#1;
			sel = i;
			if(i)
				inp = ~({inp[1022:0], inp[1023]});
		end

	end

	initial begin

		$dumpfile("dump.vcd");
		$dumpvars;
		
	end

endmodule
