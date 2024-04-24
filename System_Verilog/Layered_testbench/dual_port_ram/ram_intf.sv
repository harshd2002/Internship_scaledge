//RAM interface

interface mem_intf #(int DEPTH = 16, byte DWIDTH = 8, byte AWIDTH = $clog2(DEPTH)) (input bit clk);
	logic rst;
	logic wr_enbl,rd_enbl;
	logic [DWIDTH-1:0] wr_data, rd_data;
	logic [AWIDTH-1:0] wr_addr, rd_addr;

	clocking mem_cb @(posedge clk);
		default input #1 output #1;
		output wr_enbl, wr_data, wr_addr, rd_enbl, rd_addr;
		input rd_data;
	endclocking

	modport MEM_TB(clocking mem_cb,
									output rst);
endinterface
