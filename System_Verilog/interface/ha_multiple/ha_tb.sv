//half adder test bench

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

