`timescale 100ms / 1us

module dig_clock
	#(parameter FREQ = 4'd10,
							UNIT = 3'd6,
							TOTAL_TIME = 4'd12)
	(input clk, rst_n,
	 output [2:0] sec_o, min_o, 
	 output [3:0] hour_o
	);

	reg [2:0] sec_r, min_r;
	reg [3:0] hr_r;
	reg [4:0] count;

	assign sec_o = sec_r;
	assign min_o = min_r;
	assign hour_o = hr_r;

	always @(posedge clk, negedge rst_n) begin

		if(!rst_n) begin
			sec_r <= 1'b0;
			min_r <= 1'b0;
			hr_r <= 1'b0;
			count <= 4'b0;
		end
		else if(count != FREQ-1)
			count <= count + 1'b1;
		else begin
			sec_r <= sec_r + 1'b1;
			if(sec_r == UNIT-1) begin
				min_r <= min_r + 1'b1;
				sec_r <= 3'b0;
			end
			if((min_r == UNIT-1) && (sec_r == UNIT-1)) begin
				hr_r <= hr_r + 1'b1;
				min_r <= 3'b0;
			end
          if((hr_r == TOTAL_TIME-1) && (min_r == UNIT-1) && (sec_r == UNIT-1))
				hr_r <= 4'b0;
			count <= 4'b0;
		end

	end

endmodule
