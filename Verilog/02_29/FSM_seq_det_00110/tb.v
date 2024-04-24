module tb();

	reg clk, rstn, ip;
	integer i;
	wire out;

	mealy_5bit dut(.clk(clk),
					.rstn(rstn),
					.ip(ip),
					.op(out)
					);

//task for reset
	task resetn();
	begin
		@(negedge clk)
			ip = 1'b0;
			rstn = 1'b0;
		@(posedge clk)
			rstn = 1'b1;
	end
	endtask

//task to generate delay
	task delay(input integer del);
	begin
		repeat(del) @(posedge clk);
	end
	endtask

//task to load a bit
	task load(input [4:0] inp);
	begin
		for(i=0;i<4;i=i+1) begin
		@(negedge clk)
			ip = inp[i];
			delay(1);
		end
	end
	endtask
					
	initial begin
		
		resetn();
		delay(2);
		load(5'b11010);
		load(5'b10010);
		load(5'b01110);
		load(5'b01100);

		delay(10);
		$finish;

	end

	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
	
endmodule 


