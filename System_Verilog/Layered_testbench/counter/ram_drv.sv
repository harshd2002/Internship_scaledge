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
		gen_drv.get(trans_obj);
		$display($time," : driver: %0p", trans_obj);

		//logic for pins
		case(trans_obj.ops)
		0: begin
			vintf.wr_enbl = 1;
			vintf.wr_addr = trans_obj.wr_addr;
			vintf.wr_data = trans_obj.wr_data;
			vintf.rd_enbl = 0;
		end
		1: begin
			vintf.wr_enbl = 0;
			vintf.rd_enbl = 1;
			vintf.rd_addr = trans_obj.rd_addr;
		end
		2: begin
			vintf.wr_enbl = 1;
			vintf.wr_addr = trans_obj.wr_addr;
			vintf.wr_data = trans_obj.wr_data;
			vintf.rd_enbl = 1;
			vintf.rd_addr = trans_obj.rd_addr;
		end
		endcase
	endtask
	task print_drv();
		$display("---------------------------driver--------------------");
		$display("Time\tName\t\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\twr_enbl\t\t%0d", $time, vintf.wr_enbl);
		$display("%0d\trd_enbl\t\t%0d", $time, vintf.rd_enbl);
		$display("%0d\twr_addr\t\t%0d", $time, vintf.wr_addr);
		$display("%0d\trd_addr\t\t%0d", $time, vintf.rd_addr);
		$display("%0d\twr_data\t\t%0d", $time, vintf.wr_data);
		$display("%0d\trd_data\t\t%0d", $time, vintf.rd_data);
		$display("-------------------------------------------------------");
	endtask
endclass
