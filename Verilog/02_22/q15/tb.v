module tb();

	reg enbl;
	reg [5:0] inp;
	wire [63:0] out;

	integer i;

	decoder_6x64_3x8 dut(.decoder_en(enbl), .decoder_in(inp), .decoder_out(out));

//task to generate delay
	task delay(input integer del);
	begin
		#del;
	end
	endtask

	task load();
	begin
		inp = inp + 1;
	end
	endtask

	initial begin

		enbl = 1'b0;
		inp = 6'd0;
		delay(5);
		enbl = 1'b1;
		delay(2);
		for(i=0; i<63;i=i+1) begin
			load();
			delay(2);
		end
		
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
