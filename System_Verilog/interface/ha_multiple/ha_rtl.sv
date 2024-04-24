//half adder RTL design

module rtl_ha(ports_ha.RTL_P rtlp);
	always @(*) begin
		{rtlp.carry, rtlp.sum} = rtlp.a + rtlp.b;
	end
endmodule

