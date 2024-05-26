//monitor class

class monitor;
	//object of transaction class to store data
	transaction trans_h;
	//mailbox to pass data to predictor and scoreboard
	mailbox #(transaction) mon_pred_scrbd;
	//virtual interface to connect with original interface (mux_interface)
	virtual mux_interface vintf;
	//connecting mailbox and virtual interface
	function void connect(mailbox #(transaction) mon_pred_scrbd, virtual mux_interface  vintf);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.vintf = vintf;
	endfunction
	//converting pin level data into transaction level data
	task run();
  forever @(negedge vintf.MON_MP.clk) begin
		trans_h = new();
		//logic to generate transaction level data
		$cast(trans_h.ops_e,vintf.sel_i);
		trans_h.sel_i = vintf.sel_i;
    trans_h.enb = vintf.enb;
		trans_h.A = vintf.A;
		trans_h.B = vintf.B;
		trans_h.C = vintf.C;
		trans_h.D = vintf.D;
    trans_h.out = vintf.out;
		//storing data for scoreboard and predictor
		mon_pred_scrbd.put(trans_h);
    trans_h.print_trans("monitor");
  end
	endtask
endclass
