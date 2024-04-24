// and gate top level module
`include "and_test.sv"
`include "and_intf.sv"
`include "and_rtl.sv"

module and_top();
	and_intf intf();
	and_test tb(intf);
	and_rtl dut(intf);
endmodule
