//interface

interface mux_interface;
	logic [31:0] A, B, C, D;
	logic [3:0] sel_i;
	logic [32:0] out;

	modport MEM_TB(output A, B, C, D, sel_i,
								 input out);
endinterface
