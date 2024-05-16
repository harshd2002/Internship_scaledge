//driver class

class driver;
	//object of transaction class to store data
	transaction trans_h;
	//mailbox to get data from generator
	mailbox #(transaction) gen_drv;
	//virtual interface to connect with original interface (mem_intf)
	virtual mux_interface vintf;
	//connecting mailbox and virtual interface
	function void connect(mailbox #(transaction) gen_drv, virtual mux_interface vintf);
		this.gen_drv = gen_drv;
		this.vintf = vintf;
	endfunction
	//converting transaction level data to pin level
	task run();
  forever @(posedge vintf.DRV_MP.clk) begin
		gen_drv.get(trans_h);
		$display($time," : driver: %0p", trans_h);

		//logic for pins
		$cast(vintf.sel_i,trans_h.ops_e);
		$cast(trans_h.sel_i,trans_h.ops_e);
    vintf.enb = trans_h.enb;
		vintf.A = trans_h.A;
		vintf.B = trans_h.B;
		vintf.C = trans_h.C;
		vintf.D = trans_h.D;
    trans_h.print_trans("driver");
    -> item_done;
  end
	endtask
endclass
