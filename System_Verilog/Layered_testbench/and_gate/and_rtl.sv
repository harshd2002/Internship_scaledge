// and gate rtl

module and_rtl(and_intf.DUT_P rtlp);
	assign rtlp.y_o = rtlp.a_i & rtlp.b_i;
endmodule
