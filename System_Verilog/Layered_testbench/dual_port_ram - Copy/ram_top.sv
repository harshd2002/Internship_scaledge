////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_top.sv
//description: top module
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM top level module
`ifndef RAM_TOP
`define RAM_TOP

//`include "ram_rtl.sv"
`include "pkg_files.sv"

import pkg_files::*;
`include "ram_intf.sv"

module mem_top();

	//clock
	bit clk;
	//object of test class to call tasks
	mem_test test_obj;
	//reference model memory
	mem_intf #(.DEPTH(256), .DWIDTH(8)) intf(clk);
	//dut instantiation
	ram_rtl dut(.clk(clk),
					.rst(intf.rst),
					.wr_enbl(intf.wr_enbl),
					.wr_addr(intf.wr_addr),
					.wr_data(intf.wr_data),
					.rd_enbl(intf.rd_enbl),
					.rd_addr(intf.rd_addr),
					.rd_data(intf.rd_data)
					);

  //reset task
  always begin
    @(reset_done)
  //task reset();
  //-> reset_done;
		intf.rst = 1;
		repeat(2) @(posedge clk);
		intf.rst = 0;
  end

	//initializing variables and calling tasks
	initial begin

		test_obj = new();
    fork
		run_test();
    //initial reset
    -> reset_done;
    join
		#10;
		$finish;
	end
	//generating clock
	always #5 clk = ~clk;

  //run_test
  task run_test();
    test_obj.build();
		test_obj.connect(intf);
    test_obj.run();
  endtask

endmodule
`endif
