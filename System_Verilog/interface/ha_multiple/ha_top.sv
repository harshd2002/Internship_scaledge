//half adder top level module

`include "ha_intf.sv"
`include "ha_rtl.sv"
`include "ha_tb.sv"

module top_ha();
	ports_ha ha_intf();
	rtl_ha dut(ha_intf);
	tb_ha tb(ha_intf);
endmodule

