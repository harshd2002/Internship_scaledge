//RAM top level module

`include "pkg_files.sv"
`include "interface.sv"
import pkg_files::*;
`include "rtl.sv"

module top();

	//clock
	bit rstn=1;
	//object of test class to call tasks
	test test_h;
	//reference model memory
	mux_interface intf(clk, rstn);
	//dut instantiation
	mux dut(.clk(clk),
					.rstn(rstn),
					.A(intf.A),
					.B(intf.B),
					.C(intf.C),
					.D(intf.D),
					.sel_i(intf.sel_i),
					.out(intf.out),
          .enb(intf.enb)
					);
	//initializing variables and calling tasks
	initial begin
		test_h = new();
		test_h.build();
    test_h.connect(intf);
    test_h.run();
    #20;
		$finish;
	end

  //reset block
  always @(reset_evt) begin
		rstn = 0;
		#RST_DEL;
		rstn = 1;
  end
	//generating clock
	always #5 clk = ~clk;

endmodule

