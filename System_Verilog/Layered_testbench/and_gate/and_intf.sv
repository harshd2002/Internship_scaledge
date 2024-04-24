//AND gate interface

interface and_intf();
	logic a_i, b_i, y_o;
	modport DUT_P(input a_i, b_i,
								output y_o);
	modport TB_P(input y_o,
								output a_i, b_i);
endinterface
