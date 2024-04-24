module tb;

	reg clk, rst;
	wire [2:0] sec, min;
	wire [3:0] hr;

	dig_clock dut( .clk(clk), .rst_n(rst), .sec_o(sec), .min_o(min), .hour_o(hr));

	initial begin

	clk = 0;
	forever #5 clk = ~clk;

	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

	initial begin

		rst = 1'b0;
		#20;
		rst = 1'b1;
		#500;
		$finish;
		
	end

endmodule 
