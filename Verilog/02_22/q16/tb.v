//testbench

module tb();

  reg clk,rst,J,K;

  wire Q;

  jk_ff dut(
    .clk(clk),
		.rst(rst),
    .J(J),
    .K(K),
    .Q(Q)
    );

// task for passing J,K value.
  task value(input j, input k); 
	begin 
    J = j;
    K = k;
  end
  endtask
  
  initial begin
    clk = 1'b0;
    J = 1'b0;
    K = 1'b0;
    forever #5 clk = ~clk;
  end

// passing the input
  initial begin 
		
    @(negedge clk)
    rst = 1'b0;
    @(negedge clk)
    rst = 1'b1;
    @(negedge clk)
    value(1,0);
    @(negedge clk)
    value(0,1);
    @(posedge clk)
    value(0,0);
    @(negedge clk)
    value(1,1);
    @(posedge clk)
    value(0,0);
    @(negedge clk)
    value(1,1);
    
  end
  
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
