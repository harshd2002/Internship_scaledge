//half adder interface

interface ports_ha();
	logic a, b, sum, carry;
	modport RTL_P(input a, b,
								output sum, carry);
	modport TB_P (input sum, carry,
								output a, b);
endinterface

