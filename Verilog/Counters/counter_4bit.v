module counter(input clk,
	input rst,
	output [3:0] count
);

reg  [3:0] counter = 4'b0;

assign count = counter;

	always @(posedge clk) begin 
		if (!rst) 
			counter<=8'd0;
		else 
			counter <= counter + 1;
	end

endmodule 
