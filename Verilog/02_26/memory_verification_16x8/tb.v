//testbench - test inputs:
//1. initial reset
//2. only write (to check if only write is possible or not)
//3. only read (to check if only read is possible or not)
//4. simultaneous write and read (to check, both together  at the same time possible or not)
//5. over-writing same adddress 
//6. reading multiple times
//7. back to back read write (different address)
//8. Inbetween reset
//9. writing at every location 
//10. reading from every location
//

module tb();
	
	reg clk, rst;
	reg wr_e, rd_e;
	reg [`ADDR_WIDTH-1:0] wr_addr, rd_addr;
	reg [`DATA_WIDTH-1:0] wr_data;
	wire [`DATA_WIDTH-1:0] rd_data;

	ram dut(.clk(clk), .rst(rst), .wr_enb(wr_e), .rd_enb(rd_e), .wr_data(wr_data), .wr_addr(wr_addr), .rd_data(rd_data), .rd_addr(rd_addr));

	integer i, j;

//task to reset memory
	task reset();
	begin
		@(negedge clk);
			rst = 1'b1;
			wr_e = 1'b0;
			rd_e = 1'b0;
			wr_addr = `ADDR_WIDTH'd0;
			wr_data = `DATA_WIDTH'd0;
			rd_addr = `ADDR_WIDTH'd0;

		@(negedge clk);
			rst = 1'b0;
	end
	endtask

//task to write at an address
	task write(input [`ADDR_WIDTH-1:0] address,
							input [`DATA_WIDTH-1:0] data);
	begin
		@(negedge clk);
		wr_e = 1'b1;
		wr_addr = address;
		wr_data = data;
	end
	endtask

//task to read from an address
	task read(input [`ADDR_WIDTH-1:0] address);
	begin
		@(negedge clk);
		rd_e = 1'b1;
		rd_addr = address;
	end
	endtask

//task to generate delay
	task delay(input integer del);
	begin
		repeat(del) @(negedge clk);
	end
	endtask

//to input test values
	initial begin

		//initial reset
		reset();

		//writing and reading at every location simultaneously
		fork
			for(i=0; i<`DEPTH; i=i+1) begin
				write(i, $random);
			end
			for(j=0; j<=`DEPTH; j=j+1) begin
				read(j ? j-1 : j);
			end
		join
		delay(1);
		wr_e = 1'b0;
		rd_e = 1'b0;

		//only write
		write(`ADDR_WIDTH'd7, `DATA_WIDTH'd56);
		delay(1);
		wr_e = 1'b0;

		//only read
		read(`ADDR_WIDTH'd7);
		delay(1);
		rd_e = 1'b0;

		//overwriting and reading same address
		fork
			for(i=0; i<4; i=i+1) begin
				write(4, $random);
			end
			for(j=0; j<=4; j=j+1) begin
				read(4);
			end
		join
		delay(1);

		//inbetween reset
		reset();

		delay(5);
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
