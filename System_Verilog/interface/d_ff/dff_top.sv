//D-flipflop top level module

`include "dff_tb.sv"
`include "dff_rtl.sv"
`include "dff_intf.sv"

module dff_top();
	bit clk;
	always #5 clk = ~clk;
	dff_intf intf(.clk(clk));
	dff_rtl dut(intf);
	dff_tb tb(intf);

endmodule
