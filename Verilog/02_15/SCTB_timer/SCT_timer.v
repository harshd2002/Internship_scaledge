`timescale 100ms / 1us

module timer #(parameter FREQ = 3'd5,
												 MAX_TIME = 4'd10)
						(input timer_clock,
						input timer_rstn,
						input timer_load,
						input [MAX_TIME-1:0] timer_data,
						output timer_out
						);

						reg out;
						reg [12:0] count;

						assign timer_out =  out;

						always @(posedge timer_clock or negedge timer_rstn) begin

							if(!timer_rstn) begin
								out <= 1'b0;
								count <= 13'dx;
							end
							else if(timer_load)
								count <= timer_data * FREQ;
							else begin
								if(count>13'd0)
									count <= count - 1'b1;
								else if(count == 1'b0)
									out <= 1'b1;
							end

						end

endmodule
