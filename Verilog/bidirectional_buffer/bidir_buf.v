`timescale 1ns / 100ps

module bidir_buf(input ctrl,
		 inout a,
		 inout b
	);
	
	assign a = ctrl? b : 1'bz;
	assign b = ctrl? 1'bz : a;

endmodule
