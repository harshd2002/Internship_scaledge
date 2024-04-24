//half_adder using interface in single file

interface ports_ha();
	logic a, b, sum, carry;
	modport RTL_P(input a, b,
								output sum, carry);
	modport TB_P (input sum, carry,
								output a, b);
endinterface

module top_ha();
	ports_ha ha_intf();
	rtl_ha dut(ha_intf);
	tb_ha tb(ha_intf);
endmodule

module rtl_ha(ports_ha.RTL_P rtlp);
	always @(*) begin
		{rtlp.carry, rtlp.sum} = rtlp.a + rtlp.b;
	end
endmodule

module tb_ha(ports_ha.TB_P tbp);
	initial begin
		$monitor($time," : a: %0d, b: %0d, sum: %0d, carry: %0d", tbp.a, tbp.b, tbp.sum, tbp.carry);
		tbp.a = 0; tbp.b = 0;
		#1;
		tbp.a = 1; tbp.b = 0;
		#1;
		tbp.a = 0; tbp.b = 1;
		#1;
		tbp.a = 1; tbp.b = 1;
		#1;
	end
endmodule
