//design - round robin arbiter
//Arbiter serves every requet for 1 clock cycle
//Asynchronus active low reset

//1. Arbiter will grant 1st grant as per the priority if multiple requests arrive
//2. After 1st request is served, arbiter will serve another request available.

`timescale 1ns / 1ps

module rra #(parameter REQS = 4)
	(input clk,rst,
	input [REQS-1'b1:0] req,
	output [REQS-1'b1:0] grant
	);

	parameter s0 = 3'b000,
		  	s1 = 3'b001,
		  	s2 = 3'b010,
		  	s3 = 3'b011,
		  	s4 = 3'b100;
	  
	  reg [$clog2(REQS) : 0] crt;
	  reg [REQS-1'b1:0] gnt;

	  assign grant = gnt;
	  
	  always @(posedge clk or negedge rst) begin
	
		if(!rst) begin
			crt <= s0;
			gnt <= 4'b0;
		end
		else begin

			case (crt)
				s0: begin
					gnt <= 4'b0000;
					if(req[0])
						crt <= s1;
					else if(req[1])
						crt <= s2;
					else if(req[2])
						crt <= s3;
					else if(req[3])
						crt <= s4;
					else
						crt <= s0;
				end
				s1: begin
					gnt <= 4'b0001;
					if(req[1])
						crt <= s2;
					else if(req[2])
						crt <= s3;
					else if(req[3])
						crt <= s4;
					else if(req[0])
						crt <= s1;
					else
						crt <= s0;
				end
				s2: begin
					gnt <= 4'b0010;
					if(req[2])
						crt <= s3;
					else if(req[3])
						crt <= s4;
					else if(req[0])
						crt <= s1;
					else if(req[1])
						crt <= s2;
					else
						crt <= s0;
				end
				s3: begin
					gnt <= 4'b0100;
					if(req[3])
						crt <= s4;
					else if(req[0])
						crt <= s1;
					else if(req[1])
						crt <= s2;
					else if(req[2])
						crt <= s3;
					else
						crt <= s0;
				end
				s4: begin
					gnt <= 4'b1000;
					if(req[0])
						crt <= s1;
					else if(req[1])
						crt <= s2;
					else if(req[2])
						crt <= s3;
					else if(req[3])
						crt <= s4;
					else
						crt <= s0;
				end
				default: begin
					gnt <= 4'b0;
					crt <= s0;
				end
			endcase

		end
	
	end

endmodule
