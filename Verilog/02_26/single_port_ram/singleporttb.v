// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module singleporttb;
 	parameter WIDTH = 8, DEPTH = 64, ADDR = 6;
	reg cs,wr,clk,rstn;
	reg [ADDR-1:0] addrtb;
	wire [WIDTH-1:0] datatb;
  reg [WIDTH-1:0] datatmp;
	
	//singleport module instantiation
	singleport dut(.cs(cs),.wr(wr),.clk(clk),.rstn(rstn),
	               .addr(addrtb),.data(datatb));
	
	
	//setting up initial conditions
	initial begin
		{cs,wr,clk,rstn} = 4'b0001;
		addrtb = 8'd0;
	end
 
  //can't drive wire inside a task 
  assign datatb = datatmp;

	//Clock generation
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	//Task to reset ram
	task reset();
	begin
	@(negedge clk);
	rstn = 0;
	repeat(2) @(negedge clk);
	rstn = 1;
	end
	endtask

	//Task for write operation with number of time,addr and data from user
  task write_ram(input [ADDR-1:0] add, input [WIDTH-1:0] dtt);
	begin
	@(negedge clk);		
	  cs = 1'b1;
		addrtb = add;
		datatmp = dtt;
		wr = 1'b1; //for write operation
	end
	endtask
	
	//Task for reading from ram
	task read_ram(input [ADDR-1:0] add);
	begin
	 @(negedge clk);
		cs = 1'b1;
		addrtb = add;
		wr = 1'b0; //for read operation
	end
	endtask
	
	//Task to access first memory address
	task min_addr();
	begin
	@(negedge clk);
		write_ram(6'd0,{$random}%255);//single time, to 000000, with random value
		read_ram(6'd0);
	end
	endtask

	//Task to access last memory address
	task max_addr();
	begin
		write_ram(6'd63,{$random}%255);//single time, to 111111, with random value
		read_ram(6'd63);
	end
	endtask

	//Task to access any random address of ram
	task random_addr();
	begin
		reg [ADDR-1:0] ran_addr;
		ran_addr = {$random}%35;

		write_ram(ran_addr,{$random}%255);//single time, to 111111, with random value
		read_ram(ran_addr);
	end
	endtask

	//Task for back to back write and read operations
	task btb_wr_rd(input integer count);
	begin
	  reg [ADDR-1:0] ran_addr;

		repeat(count) @(negedge clk) begin
		ran_addr = {$random}%63;
		write_ram(ran_addr,{$random}%255);
		read_ram(ran_addr);
		end
	end
	endtask

	//Multiple write and read operation 
	task multi_wr_rd(input integer count);
	begin
		//Assiging random address values to write and read 
	  reg [ADDR-1:0] ran_addr,wr_a,rd_a;
		ran_addr = {$random}%63;
		wr_a = ran_addr; //for write as if taken same in repeat will increement that
											//and it will start reading from that +4 incremented data location
		rd_a = ran_addr;

		repeat(count) @(negedge clk) begin
		write_ram(wr_a,{$random}%255);
		wr_a = wr_a + 1'b1;
		end
		repeat(count) @(negedge clk) begin
		read_ram(rd_a);
		rd_a = rd_a + 1'b1;
		end
	end
	endtask

	/*task simulantaneously_rd_wr();
	begin
		fork
			
		join
	end
	endtask*/
  
 	 initial begin
       //reset 
       reset();
       
       //Minimum address boundary test
       @(negedge clk);
       min_addr();
       
       //maximum address boundary test
       @(negedge clk);
       max_addr();
       
       //Random address test
       @(negedge clk);
       random_addr();
       
       //on the fly rst to verify it resets memory or not
       @(negedge clk);
       reset();
       
       //back to back write and read operations
       @(negedge clk);
       btb_wr_rd(5);
       
       //Multiple write and read operations
       @(negedge clk);
       multi_wr_rd(5);
				
			//Chip Select 
			 @(negedge clk);
			 cs = 1'b0;
			 addrtb = {$random}%63;
			 datatmp = {$random}%255;
			 wr = 1'b1; //for write operation

			 repeat(3) @(negedge clk);
			 wr = 1'b0;
			 addrtb = {$random}%63;

				repeat(10) @(negedge clk);
				reset();

			 //undefined write and read

			 //errorness scenarios false checking

			 //waited (delayed enable signal)
       
	 end

	initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      repeat(150) @(negedge clk);
      $finish;
	end

endmodule

