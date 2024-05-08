`ifndef RAM_MON_SV
`define RAM_MON_SV
class ram_mon;
	
	//instance of transaction class
	ram_trans trns_h;
	//mailbox to scoreboard
	//mailbox #(ram_trans) mon_src;
	bit [1:0] castt;
	//mailbox to reference model
	mailbox #(ram_trans) mon_ref;

	//virtual interface 
	virtual ram_intf vintf;


	function void connect(	mailbox #(ram_trans) mon_ref,
	virtual ram_intf vintf);
		this.vintf = vintf;
		this.mon_ref = mon_ref;
	endfunction

//argument giving complusory
//never change new function

//future class extension creates new () problem
//reuseablitiy reduces when extending the class 
//ease in debug 

	task run_phase();
		
		forever@(vintf.moncb) begin
		$display("in monitor %0t",$time);
			monitor();
			mon_ref.put(trns_h);
			trns_h.print_info("MONITOR");
		end

	endtask
	//handshaking in Monitor 
  //optimization 
	task monitor();
		//@(vintf.moncb);
		trns_h = new();
		//protocol and right condition 
		// 00 -> IDLE, 01 -> Write, 10 -> Read, 11 -> SIM_WR
		castt = {vintf.moncb.rd_en,vintf.moncb.wr_en};
		$cast(trns_h.trn_e,castt);
		//address
		@(posedge vintf.clk);
		trns_h.wr_addr = vintf.moncb.wr_addr;
		trns_h.rd_addr = vintf.moncb.rd_addr;
		//data
		trns_h.wr_data = vintf.moncb.wr_data;
		//read 
		trns_h.rd_data = vintf.moncb.rd_data;
	endtask
endclass
`endif
