//D-flipflop interface block

interface dff_intf(input bit clk);
	logic d,q,rstn;
	clocking dff_cb @(posedge clk);
		default input #1 output #2;
		output d, rstn;
		input q;
	endclocking
	modport DFF_P(input d, clk, rstn,
								output q);
	modport DFF_TB(clocking dff_cb);
endinterface
