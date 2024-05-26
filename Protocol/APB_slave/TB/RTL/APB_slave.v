////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//Design - APB slave

`ifndef APB_DESIGN
`define APB_DESIGN

module APB_slave #(parameter DATA_WIDTH = 32,
					DEPTH = 32,
					ADDR_WIDTH = 32
					)
				(input pclk,
				 input presetn,							//active low reset
				 input [DATA_WIDTH-1:0] pwdata,		
				 input penable,
				 input [ADDR_WIDTH - 1:0] paddr,
				 input pwrite,							//0 -> read operation, 1 -> write operation.
				 input pselect,
				 output pready,
				 output reg [DATA_WIDTH-1:0] prdata,
				 output reg pslverr
				 );


	parameter IDLE = 2'b00,
				SETUP = 2'b01,
				ACCESS = 2'b10;

	reg [DATA_WIDTH - 1:0] mem [0:DEPTH-1];
	reg [1:0] pr_state, nxt_state;
	reg wait_state = 0;
  reg [2:0] time_out;

	reg timer_o;
	reg [2:0] t_counter;

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
			//pready = 1'b0;
			nxt_state = IDLE;
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

					if(timer_o || !wait_state) begin
						//pready = 1'b1;
						if(pselect && penable) begin
							if(pwrite) begin
								mem[paddr[4:0]] = pwdata;
							end
							else begin
								prdata = mem[paddr[4:0]];
							end
						end
					end
					else begin
						//pready = 1'b0;
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
			timer_o <= 1'b0;
			t_counter <= time_out;
		end
		else if(wait_state) begin
			if(t_counter>13'd0) begin
			  timer_o <= 1'b0;
				t_counter <= t_counter - 1'b1;
			end
			else begin
				timer_o <= 1'b1;
				t_counter <= time_out;
				//wait_state <= 1'b0;
			end
		end
		else begin
			timer_o <= 1'b0;
		end
	end
  
  assign pready = (presetn && (timer_o || !wait_state) && penable) ? 1'b1 : 1'b0;

endmodule
`endif
