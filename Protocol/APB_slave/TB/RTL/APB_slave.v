//Design - APB slave


`timescale 1ns / 1ps

module APB_slave #(parameter DATA_WIDTH = 8,
					DEPTH = 256,
					ADDR_WIDTH = 8
					)
				(input pclk,
				 input presetn,							//active low reset
				 input [DATA_WIDTH-1:0] pwdata,		
				 input penable,
				 input [ADDR_WIDTH - 1:0] paddr,
				 input pwrite,							//0 -> read operation, 1 -> write operation.
				 input pselect,
				 output reg pready,
				 output reg [DATA_WIDTH-1:0] prdata,
				 output reg pslverr
				 );


	parameter IDLE = 2'b00,
				SETUP = 2'b01,
				ACCESS = 2'b10;

	reg [DATA_WIDTH - 1:0] mem [0:DEPTH-1];
	reg [1:0] pr_state, nxt_state;
	reg wait_state;

	reg t_out;
	reg [DATA_WIDTH-1:0] t_counter;

	//assign prdata = ((state == access) && pselect && penable) ? mem[paddr] : 'dz;


	always @(posedge pclk or negedge presetn) begin
		if(!presetn) begin
			pr_state <= IDLE;
		end
		else begin
			pr_state <= nxt_state;
		end


	end

	always @(*) begin
		if(!presetn) begin
			prdata = 'd0;
			pslverr = 1'b0;
			pready = 1'b0;
			nxt_state = IDLE;
			wait_state = 1'b0;
		end
		else begin
			case(pr_state)
				IDLE: begin
					if(pselect && !penable)
						nxt_state = SETUP;
					else
						nxt_state = IDLE;
				end
				
				SETUP: begin
						pready = 1'd0;
					if(pselect && penable) begin
						nxt_state = ACCESS;
					end
					else if(pselect && !penable) begin
						nxt_state = IDLE;
					end
					else begin
						nxt_state = IDLE;
					end
				end

				ACCESS: begin
					if(pselect) begin
						nxt_state = SETUP;

					if(t_out || !wait_state) begin
						pready = 1'b1;
						if(pselect && penable) begin
							if(pwrite) begin
								mem[paddr] = pwdata;
							end
							else begin
								prdata = mem[paddr];
							end
						end
					end
					else begin
						pready = 1'b0;
						nxt_state = ACCESS;
					end
					end
					else
						nxt_state = IDLE;
				end
			endcase
		end
	end

	always @(posedge pclk or negedge presetn) begin
		if (!presetn) begin
			t_out <= 1'b0;
			t_counter <= 8'd10;
		end
		else if(wait_state) begin
			if(t_counter>13'd0) begin
				t_counter <= t_counter - 1'b1;
			end
			else begin
				t_out <= 1'b1;
				t_counter <= 8'd10;
				wait_state <= 1'b0;
			end
		end
		else begin
			t_out <= 1'b0;
		end
	end

endmodule

