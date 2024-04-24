//D-flipflop testbench

module dff_tb(dff_intf.DFF_TB tbp);
	initial begin
		$monitor($time, " : input: %0d, output: %0d", tbp.dff_cb.d, tbp.dff_cb.q);
		tbp.dff_cb.rstn <= 0;
		tbp.dff_cb.d <= 0;
		repeat(2) @(tbp.dff_cb);
		tbp.dff_cb.rstn <= 1;
		tbp.dff_cb.d <= 0;
		repeat(2) @(tbp.dff_cb);
		tbp.dff_cb.rstn <= 1;
		tbp.dff_cb.d <= 1;
		repeat(2) @(tbp.dff_cb);
		tbp.dff_cb.rstn <= 0;
		tbp.dff_cb.d <= 1;
		#1;
		#25;
		$finish;
	end
endmodule
