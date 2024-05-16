//interface

interface mux_interface(input clk, input rstn);
	logic [31:0] A, B, C, D;
	logic [3:0] sel_i;
	logic [32:0] out;
  logic enb;

	modport DRV_MP(output A, B, C, D, sel_i,enb,
								 input clk);
  modport MON_MP(input A, B, C, D, sel_i,enb,
								 input clk);
endinterface
