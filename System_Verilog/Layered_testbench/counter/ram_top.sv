//RAM top level module
`ifndef RAM_TOP
`define RAM_TOP

`include "ram_intf.sv"
`include "pkg_files.sv"
import pkg_files::*;
`include "ram_rtl.sv"

module mem_top();

	bit clk;

	mem_test test_obj;
	mem_intf #(.DEPTH(256), .DWIDTH(8)) intf(clk);
	ram_rtl dut(.clk(clk),
					.rst(intf.rst),
					.wr_enbl(intf.wr_enbl),
					.wr_addr(intf.wr_addr),
					.wr_data(intf.wr_data),
					.rd_enbl(intf.rd_enbl),
					.rd_addr(intf.rd_addr),
					.rd_data(intf.rd_data)
					);
	initial begin
		intf.rst = 0;
		repeat(2) @(posedge clk);
		intf.rst = 1;
		repeat(2) @(posedge clk);
		intf.rst = 0;
		repeat(2) @(posedge clk);

		test_obj = new(intf);
		test_obj.build_run();
		#100;
		$finish;
	end
	always #5 clk = ~clk;
endmodule

`endif
