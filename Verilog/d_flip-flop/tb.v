module tb();

reg d,clk,rst;
wire q,qb;

test m1(.d(d),.clk(clk),.rst(rst),.q(q),.qb(qb));

initial begin
	clk = 0;
	rst = 0;
	//d = 0;
	#10 //d = 1;
	#30 rst = 1;
	#30; //d = 0;
	#100 $finish;
	
end

always #10 clk = ~clk;

endmodule 
