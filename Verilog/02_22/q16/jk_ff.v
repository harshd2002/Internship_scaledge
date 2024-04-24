`timescale 1ns/1ps

module jk_ff(input clk,rst,
	input J,
	input K,
	output reg Q
	);

	reg Q_bar;

always @(posedge clk) begin
	
	if (!rst) begin
		Q <= 0;
		Q_bar <= 1;
	end

	else begin
	
	case({J,K})

		2'b00: begin

			Q <= Q;
			Q_bar <= Q_bar;

		end
		2'b01: begin

			Q <= 0;
			Q_bar <= 1;

		end
		2'b10:begin

			Q <= 1;
			Q_bar <= 0;

		end
		2'b11: begin

			Q <= Q_bar;
			Q_bar <= Q;

		end

	endcase
	end
end

endmodule
