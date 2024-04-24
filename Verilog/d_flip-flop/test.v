module test( 	input d,
		input clk,
		input rst,
		output q,
		output qb);

	reg a;
	assign q = a;
	assign qb = ~a;
	
	always @(posedge clk and negedge rst) begin

		if(!rst)
			a = 1'b0;
		else
			a = d;
	
	end 

endmodule 
