`include "transaction.sv"
//monitor class

class monitor;
	//object of transaction class to store data
	transaction trans_obj;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(transaction) mon_pred_scrbd;
	//virtual interface to connect with original interface (mux_interface)
	virtual mux_interface vintf;
	//connecting mailbox and virtual interface
	function new(mailbox #(transaction) mon_pred_scrbd, virtual mux_interface  vintf);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.vintf = vintf;
	endfunction
	//converting pin level data into transaction level data
	task run();
		trans_obj = new();
		//logic to generate transaction level data
			trans_obj.op_e = vintf.sel_i;
			trans_obj.sel_i = vintf.sel_i;
			trans_obj.A = vintf.A;
			trans_obj.B = vintf.B;
			trans_obj.C = vintf.C;
			trans_obj.D = vintf.D;
		//storing data for scoreboard and oeredictor
		mon_pred_scrbd.put(trans_obj);
	endtask
endclass