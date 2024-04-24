//testbebnch

module tb();
  
  reg clk,reset,T;
  wire [2:0]Q;

  counter_t_ff dut(
    .clk_i(clk),
    .T_i(T),
    .reset_i(reset),
    .Q_o(Q)
    );

  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
	end
 
  initial begin

    reset = 1'b0;
    T = 1'b0;
    repeat(2) @(negedge clk);
    reset = 1'b1;

    T = 1'b1; 

  end   

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
