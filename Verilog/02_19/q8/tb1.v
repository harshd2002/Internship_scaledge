//testbench

module tb();

	reg [3:0] inp;
	wire y;

	nor4_nor2 dut(.inp(inp), .out(y));

//task to load values
	task load(input [3:0] i);
	begin
		inp = i;
	end
	endtask

//task to generate delay 
	task delay(input integer del);
	begin
		#del;
	end
	endtask

	initial begin

		load(4'h8);
		delay(5);
		load(4'h0);
		delay(5);
		load(4'h4);
		delay(5);
		load(4'h0);
		delay(5);
		load(4'h2);
		delay(5);
		load(4'h0);
		delay(5);
		load(4'h1);
		delay(5);
		load(4'h0);
		delay(5);

	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
