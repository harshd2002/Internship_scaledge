////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_intf.sv
//description: interface
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM interface

`ifndef RAM_INTERFACE
`define RAM_INTERFACE

interface mem_intf #(int DEPTH = 16, byte DWIDTH = 8, byte AWIDTH = $clog2(DEPTH)) (input bit clk);
	logic rst;
	logic wr_enbl,rd_enbl;
	logic [DWIDTH-1:0] wr_data, rd_data;
	logic [AWIDTH-1:0] wr_addr, rd_addr;

	clocking mem_cb @(posedge clk);
		default input #0 output #8;
		output wr_enbl, wr_data, wr_addr, rd_enbl, rd_addr;
		//input rd_data;
	endclocking
	clocking mem_cb_mon @(posedge clk);
		default input #0 output #1;
		input wr_enbl, wr_data, wr_addr, rd_enbl, rd_addr;
		input rd_data;
	endclocking

	modport MEM_TB(clocking mem_cb,
									output rst);
endinterface
`endif
