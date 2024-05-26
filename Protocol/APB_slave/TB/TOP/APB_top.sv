////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB top module

`ifndef APB_TOP
`define APB_TOP

import apb_pack::*;
`include "../TEST/APB_test.sv"

module apb_top();

	//clock and reset
	bit Presetn;
  bit Pclk;

	//object of test class to call tasks
	apb_test test_h;

	//reference model memory
	apb_intf intf(Pclk, Presetn);

	//dut instantiation
	APB_slave dut(.pclk(Pclk),
					      .presetn(Presetn),
					      .pwdata(intf.Pwdata),
					      .penable(intf.Penable),
					      .paddr(intf.Paddr),
					      .pwrite(intf.Pwrite),
					      .pselect(intf.Psel),
					      .pready(intf.Pready),
                .prdata(intf.Prdata),
                .pslverr(intf.Pslverr)
					      );

  //reset block
  always @(reset_evt) begin
		Presetn = 0;
		#RST_TIME;
		Presetn = 1;
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
    #40;
		$finish;
	end

	//generating clock
	always #5 Pclk = ~Pclk;

endmodule
`endif
