`timescale 1ns / 1ps

module siso_shift_reg#(parameter BIT_SHIFT = 4)		//To define delay of clock cycles required between serial input(serial_in) and serial output(serial_out).(Or data required to be shifted by " BIT_SHIFT " bits.)
						(input clock_in,
						input resetn,
						input serial_in,
						output serial_out
						);

						//wires to drive output of one FF into input of other
						wire [BIT_SHIFT-2:0] ff_o;

						genvar i;

						generate

							for(i=0;i<BIT_SHIFT;i=i+1) begin
								if(i==0)
									dff ff0(.d(serial_in), .clk(clock_in), .rstn(resetn), .q(ff_o[0]));
								else if(i < BIT_SHIFT-1) 
									dff ff1(.d(ff_o[i-1]), .clk(clock_in), .rstn(resetn), .q(ff_o[i]));
								else
									dff ff2(.d(ff_o[BIT_SHIFT-2]), .clk(clock_in), .rstn(resetn), .q(serial_out));
							end

						endgenerate

endmodule

//D Flip-Flop module 
module dff(input d,
           input clk,
           input rstn,
           output q
           );
    reg a;
		wire qb;
    assign q = a;
    assign qb = ~a;
    always @(posedge clk or negedge rstn)
      begin
        if(!rstn)
          a <= 1'b0;
        else
          a <= d;
      end
endmodule 
