////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_intf.sv
//description: interface
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//FIFO interface

`ifndef FIFO_INTERFACE
`define FIFO_INTERFACE

interface fifo_intf (input wr_clk, input rd_clk, input rstn);
	logic wr_enbl,rd_enbl;
	logic [7:0] wr_data, rd_data;
	logic full, empty, almost_full, almost_empty, overflow, underflow;

	clocking wr_drv_cb @(posedge wr_clk);
		default input #0 output #1;
		output wr_enbl, wr_data;
		input full, overflow;
	endclocking

	clocking rd_drv_cb @(posedge rd_clk);
		default input #0 output #1;
		output rd_enbl;
		input empty, underflow;
	endclocking

	clocking wr_mon_cb @(posedge wr_clk);
		default input #0 output #1;
		input wr_enbl, wr_data;
		input full, almost_full, overflow;
	endclocking

	clocking rd_mon_cb @(posedge rd_clk);
		default input #0 output #1;
		input rd_enbl, rd_data;
		input empty, almost_empty, underflow;
	endclocking

	modport wr_drv_mp(clocking wr_drv_cb,
									  input wr_clk);
	modport rd_drv_mp(clocking rd_drv_cb,
									  input rd_clk);
	modport wr_mon_mp(clocking wr_mon_cb,
						        input wr_clk);
	modport rd_mon_mp(clocking rd_mon_cb,
									  input rd_clk);

endinterface
`endif
