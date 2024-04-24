//generate a 2.5 MHz frequency clock

`timescale 1us / 100ns

module freq_2_5_m(output reg clock);

	parameter real FREQUENCY = 2500000;
	real time_delay;

//function to calculate time period
	function real delay();
	begin
		delay = ((1000000 / FREQUENCY) / 2);
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

		#10;
		$finish;
	end

endmodule
