
`timescale 1ns / 1ps

module mealy_5bit(clk, rstn, ip, op );

	input clk, rstn, ip;
	output reg op;
	
	parameter s0 = 3'd0;
	parameter s1 = 3'd1;
	parameter s2 = 3'd2;
	parameter s3 = 3'd3;
	parameter s4 = 3'd4;
	
	reg [2:0] curr_st;
	
	always @(posedge clk or negedge rstn) begin
	
		if(!rstn) begin
			curr_st <= s0;
			op <= 1'b0; 
			end
		else begin
		
			case(curr_st)
		
			s0:begin
				curr_st <= ip?s0:s1;
				op <= 1'b0;
			end
			s1:begin
				curr_st <= ip?s0:s2;
				op <= 1'b0;
			end
			s2:begin
				curr_st <= ip?s3:s2;
				op <= 1'b0;
			end
			s3:begin
				curr_st <= ip?s4:s1;
				op <= 1'b0;
			end
			s4:begin
				curr_st <= ip?s0:s1;
				op <= ip? 1'b0:1'b1;
			end
			default:begin
				curr_st <= s0;
				op <= 1'b0;
			end
		
		endcase
	
		end
	end
	
	
endmodule 
