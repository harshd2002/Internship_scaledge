//generate a 1.33 KHz frequency clock

`timescale 1ms / 1us

module freq_1_33_k(output reg clock);

	parameter real FREQUENCY = 1333.333;
	real time_delay;

//function to calculate time period
	function real delay();
	begin
		delay = ((1000 / FREQUENCY) / 2);
	end
	endfunction

	initial begin
		clock = 1'b0;
		time_delay = delay();
		forever #time_delay clock = ~clock;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;

		#50;
		$finish;
	end

endmodule
