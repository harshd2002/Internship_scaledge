//Testbench
//test input:
//1. initial reset
//2. 1011100
//3. in-between reset

module tb;

	reg clock, rstn, d_in;
	wire d_out;

	siso_shift_reg dut(.clock_in(clock), .resetn(rstn), .serial_in(d_in), .serial_out(d_out));

//task to reset SISO
	task resetn();
	begin
		@(negedge clock);
		d_in = 1'b0;
		rstn = 1'b0;
		repeat(1) @(negedge clock);
		rstn = 1'b1;
	end
	endtask

//task to load values
	task load(input ip_bit);
	begin
		@(negedge clock)
			d_in = ip_bit;
	end
	endtask

	task delay(input integer del);
		repeat(del) @(negedge clock);
	endtask

	initial begin
		
		//calling initial reset
		resetn();

		//input bits
		load(1);
		load(0);
		load(1);
		load(1);
		load(1);
		load(0);
		load(0);

		//calling in-between reset
		resetn();

		//ending the simulation
		delay(4);
		$finish;
		
	end

	initial begin
		clock = 1'b0;
		forever #5 clock = ~clock;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
