//RAM top level module

`include "pkg_files.sv"
`include "interface.sv"
import pkg_files::*;
`include "rtl.sv"

module top();

	//clock
	bit rstn;
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

  //reset block
  always @(reset_evt) begin
    $display("reset asserted");
		rstn = 0;
		#RST_DEL;
		rstn = 1;
  end
	
  //initializing variables and calling tasks
	initial begin
		test_h = new();
		test_h.build();
    test_h.connect(intf);
    fork
    test_h.run();
    -> reset_evt;
    join
    #10;
		$finish;
	end

	//generating clock
	always #2 clk = ~clk;

endmodule

