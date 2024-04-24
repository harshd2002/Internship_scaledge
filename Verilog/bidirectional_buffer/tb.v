module tb;

	reg ctrl;
	wire a, b;
	reg da, db;

	assign a = ctrl? 1'bz : da;
	assign b = ctrl? db : 1'bz;


	bidir_buf dut(.ctrl(ctrl), .a(a), .b(b));

	initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
		#10;
		da = 1;
		db = 0;
		#10;
		ctrl = 0;
		#10;
		ctrl = 1;
      	#100;
      	ctrl = 0;
      	$stop;

	end

endmodule
