//RAM driver class

class mem_drv;
	//object of transaction class to store data
	mem_trans trans_obj;
	//mailbox to get data from generator
	mailbox #(mem_trans) gen_drv;
	//virtual interface to connect with original interface (mem_intf)
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function new(mailbox #(mem_trans) gen_drv, virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.gen_drv = gen_drv;
		this.vintf = vintf;
	endfunction
	//converting transaction level data to pin level
	task run();
		forever @(vintf.mem_cb) begin
		gen_drv.get(trans_obj);
		$display($time," : driver: %0p", trans_obj);

		//logic for pins
		case(trans_obj.ops_e)
		0: begin
			vintf.wr_enbl = 1;
			trans_obj.wr_enbl = 1;
			vintf.wr_addr = trans_obj.wr_addr;
			vintf.wr_data = trans_obj.wr_data;
			vintf.rd_enbl = 0;
			trans_obj.rd_enbl = 0;
			vintf.rd_addr = trans_obj.rd_addr;
		end
		1: begin
			vintf.wr_enbl = 0;
			trans_obj.wr_enbl = 0;
			vintf.wr_addr = trans_obj.wr_addr;
			vintf.wr_data = trans_obj.wr_data;
			vintf.rd_enbl = 1;
			trans_obj.rd_enbl = 1;
			vintf.rd_addr = trans_obj.rd_addr;
		end
		2: begin
			vintf.wr_enbl = 1;
			trans_obj.wr_enbl = 1;
			vintf.wr_addr = trans_obj.wr_addr;
			vintf.wr_data = trans_obj.wr_data;
			vintf.rd_enbl = 1;
			trans_obj.rd_enbl = 1;
			vintf.rd_addr = trans_obj.rd_addr;
		end
		endcase
	endtask
endclass
