////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asunchronous FIFO verification
//File name: fifo_top.sv
//description: top module
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//Async FIFO top level module
`ifndef FIFO_TOP
`define FIFO_TOP

`include "fifo_pack.sv"
import fifo_pack::*;

module fifo_top();

	//clock and reset
	bit wr_clk, rd_clk, rstn;
	//object of test class to call tasks
	fifo_test test_h;
	//reference model memory
	fifo_intf intf(wr_clk, rd_clk, rstn);

	//dut instantiation
	async_fifo dut(.wr_clk(wr_clk),
                .rd_clk(rd_clk),
					      .rstn(rstn),
					      .wr_en(intf.wr_enbl),
					      .rd_en(intf.rd_enbl),
					      .wr_data(intf.wr_data),
					      .rd_data(intf.rd_data),
                .full(intf.full),
                .empty(intf.empty),
                .almost_full(intf.almost_full),
                .almost_empty(intf.almost_empty),
                .overflow(intf.overflow),
                .underflow(intf.underflow)
					      );

  //reset task
  always begin
    @(rst_evt)
		rstn = 0;
		#RST_TIME;
		rstn = 1;
  end

  //initial reset
  task initial_rstn();
    $display($time, " :Reset asserted");
    rstn = 0;
		#RST_TIME;
		rstn = 1;
    $display($time, " :Reset de-asserted");
  endtask

	//initializing variables and calling tasks
	initial begin
		test_h = new();
    test_h.build();
		test_h.connect(intf);
    fork
      initial_rstn();
      test_h.run();
    join_any
    //wait(!object_count);
    #250;
		$finish;
	end

	//generating write clock
	always #3 wr_clk = ~wr_clk;

	//generating read clock
	always #5 rd_clk = ~rd_clk;

endmodule
`endif
