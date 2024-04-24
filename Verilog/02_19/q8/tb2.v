//testbench

module tb();

	reg [3:0] inp;
	wire y;

	xor4_xor2 dut(.inp(inp), .out(y));

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
		load(4'h3);
		delay(5);
		load(4'h2);
		delay(5);
		load(4'h5);
		delay(5);
		load(4'h1);
		delay(5);
		load(4'h6);
		delay(5);
		load(4'h7);
		delay(5);
		load(4'h9);
		delay(5);
		load(4'hb);
		delay(5);
		load(4'ha);
		delay(5);
		load(4'hd);
		delay(5);
		load(4'hc);
		delay(5);
		load(4'he);
		delay(5);
		load(4'hf);
		delay(5);

	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
