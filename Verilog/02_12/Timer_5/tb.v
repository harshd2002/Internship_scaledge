//testbench:
//1. Reset: Initial reset and asserting reset before completion of timer count.
//2. Load and wait for output(timer_out) to remain high until reset is asserted.
//4. Loading before the timer count completes.

module tb;
	
	reg clk,rst,load;					//Clock, reset and load signals
	reg [9:0] timer;					//Variable for data input
	wire out;									//Output flag for timer count completion

	timer dut(.timer_clock(clk), .timer_rstn(rst), .timer_load(load), .timer_data(timer), .timer_out(out));

	task tload();							//Task for loading the timer count
	input [9:0] time_count;		//Time count
	input [2:0] unload;				//time untill load is high
	begin
		@(negedge clk)
		load = 1'b1;
		timer = time_count;
		repeat(unload) @(negedge clk);
		load = 1'b0;
	end
	endtask

	task reset();							//Task for reset
	input [2:0] unreset;
	begin
		load = 1'b0;
		@(negedge clk)
		rst = 1'b0;
		repeat(unreset) @(negedge clk);
		rst = 1'b1;
	end
	endtask

	initial begin
		reset(3);							// initial reset

		tload(5, 4);					//load and check if working properly or not
		wait(out);
		repeat(2) @(negedge clk);
		reset(2);

		tload(3, 2);					//making reset high before timer completes the count
		repeat(2) @(negedge clk);
		reset(1);

		tload(4, 1);					//reloading before the count ends.
		repeat(5) @(negedge clk);
		tload(2, 2);
		repeat(2) @(negedge clk);
		reset(1);

		#50;
		$stop;
	end

	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
