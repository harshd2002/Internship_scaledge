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

  //final block to check if anything remained inside the checker queue
  final begin
    $info("Starting final block");
    if(exp_q.size() !== 0)
      $warning("There is an expected data reamined to be checked\n Expected data is: %0p", exp_q.pop_front());
    if(act_q.size() !== 0)
      $warning("There is an actual data reamined to be checked\n Actual data is: %0p", act_q.pop_front());
    $info("Ending final block");
  end

	//generating clock
	always #5 Pclk = ~Pclk;

endmodule
`endif
