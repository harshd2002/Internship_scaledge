//D-flipflop rtl design

module dff_rtl(dff_intf.DFF_P rtlp);
	always @(posedge rtlp.clk or negedge rtlp.rstn) begin
		if(!rtlp.rstn)
			rtlp.q <= 0;
		else
			rtlp.q <= rtlp.d;
	end
endmodule
