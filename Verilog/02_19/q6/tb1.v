//Testcases
/*inputs(a,b,c,d) =  input		 output

										0001(1)	  	 0
										0000(0)      1
										0010(2) 	   0
										0100(4)   	 1
										0011(3)    	 0
										0101(5)    	 1
										0110(6)    	 0
										1000(8)    	 1
										0111(7)    	 0
										1010(10)   	 1
										1001(9)    	 0
										1100(12)   	 1
										1011(11)   	 0
										1010(10)   	 1
										1101(13)   	 0
										1000(8)    	 1
										1110(14)   	 0
										0101(5)    	 1
										1111(15)  	 0
										*/

module tb();

	reg a, b, c, d;
	wire func_out1, func_out2;

//instantiating module minterm
	minterm dut1(.a(a), .b(b), .c(c), .d(d), .func_min(func_out1));

//task to load values
	task load(input [3:0] inp);
	begin
		{a,b,c,d} = inp;
	end
	endtask

	task delay(input integer del);
	begin
		#del;
	end
	endtask

	initial begin

		load(4'd1);
		delay(5);
		load(4'd0);
		delay(5);
		load(4'd11);
		delay(5);
		load(4'd4);
		delay(5);
		load(4'd2);
		delay(5);
		load(4'd5);
		delay(5);
		load(4'd3);
		delay(5);
		load(4'd8);
		delay(5);
		load(4'd6);
		delay(5);
		load(4'd10);
		delay(5);
		load(4'd7);
		delay(5);
		load(4'd12);
		delay(5);
		load(4'd9);
		delay(5);
		load(4'd5);
		delay(5);
		load(4'd13);
		delay(5);
		load(4'd8);
		delay(5);
		load(4'd14);
		delay(5);
		load(4'd10);
		delay(5);
		load(4'd15);
		delay(5);

	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
