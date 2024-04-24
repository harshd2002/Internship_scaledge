//Self Checking Testbench:
//1. reset: initial reset and asserting reset before completion of timer count.
//2. load and wait for output(timer_out) to remain high until reset is asserted.
//4. loading before the timer count completes.

module tb;
	
	parameter FREQ = 3'd5;

	reg clk,rst,load;									//clock, reset and load signals
	reg [9:0] timer;									//variable for data input
	reg expected_out;		//actual output flag for timer count completion
	wire actual_out;		//actual output flag for timer count completion

	timer #(.FREQ(FREQ)) dut(.timer_clock(clk), .timer_rstn(rst), .timer_load(load), .timer_data(timer), .timer_out(actual_out));


//task for loading the timer count
	task tload();							
	input [9:0] time_count;		//time count
	input integer unload;			//time untill load is high
	begin
		@(negedge clk)
		load = 1'b1;
		timer = time_count;
		repeat(unload) @(negedge clk);
		load = 1'b0;
	end
	endtask


//task for reset
	task reset();							
	input integer unreset;
	begin
		load = 1'b0;
		timer = 10'd0;
		@(negedge clk)
		rst = 1'b0;
		repeat(unreset) @(negedge clk);
		rst = 1'b1;
	end
	endtask

//task to generate # cycle delay
	task cycle_delay(input integer delay);
		repeat(delay) @(negedge clk);
	endtask

//Calling tasks
	initial begin
		
		// initial reset
		reset(3);									

		//load and check if working properly or not
		tload(5, 4);					
		wait(actual_out);
		repeat(2) @(negedge clk);
		reset(2);

		//reloading before the count ends and then resetting before count ends.
		tload(4, 1);				
		repeat(5) @(negedge clk);
		tload(2, 2);
		repeat(2) @(negedge clk);
		reset(1);

		#10;
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

	always @(negedge load or negedge rst) begin

		if(!rst)
			expected_out <= 1'b0;
		else begin
			@(posedge clk);
			repeat(FREQ*timer) @(posedge clk);
			expected_out <= 1'b1;
		end

	end

	initial begin
	expected_out = 1'b0;
	forever @(negedge clk) begin
		@(expected_out or actual_out or rst)
		if(expected_out == actual_out)
			$display($time,"Test passed");
		else
			$display($time,"Test failed");
	end
	end

endmodule
