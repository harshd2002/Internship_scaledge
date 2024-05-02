////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_drv.sv
//description: driver class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM driver class

`ifndef RAM_DRIVER
`define RAM_DRIVER

class mem_drv;
	//object of transaction class to store data
	mem_trans trans_obj;
	//mailbox to get data from generator
	mailbox #(mem_trans) gen_drv;
	//virtual interface to connect with original interface (mem_intf)
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function connect(mailbox #(mem_trans) gen_drv, virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.gen_drv = gen_drv;
		this.vintf = vintf;
	endfunction
	//converting transaction level data to pin level
	task run();
		forever begin
    if(vintf.rst) begin
      //@(reset_done)
			vintf.wr_enbl = 0;
			vintf.wr_addr = 0;
			vintf.wr_data = 0;
			vintf.rd_enbl = 0;
			vintf.rd_addr = 0;
      $display($time, " :reset asserted");
      @(negedge vintf.rst);
      $display($time, " :reset deasserted");
    end
    else begin
    @(posedge vintf.mem_cb)
    -> item_done;
		gen_drv.get(trans_obj);
		$display($time," : driver: %0p", trans_obj);

		//logic for pins
		case(trans_obj.ops_e)
		1: begin
			trans_obj.wr_enbl = 1;
			trans_obj.rd_enbl = 0;
			vintf.mem_cb.wr_enbl <= 1;
			vintf.mem_cb.wr_addr <= trans_obj.wr_addr;
			vintf.mem_cb.wr_data <= trans_obj.wr_data;
			vintf.mem_cb.rd_enbl <= 0;
			vintf.mem_cb.rd_addr <= trans_obj.rd_addr;
		end
		2: begin
			trans_obj.wr_enbl = 0;
			trans_obj.rd_enbl = 1;
			vintf.mem_cb.wr_enbl <= 0;
			vintf.mem_cb.wr_addr <= trans_obj.wr_addr;
			vintf.mem_cb.wr_data <= trans_obj.wr_data;
			vintf.mem_cb.rd_enbl <= 1;
			vintf.mem_cb.rd_addr <= trans_obj.rd_addr;
		end
		3: begin
			trans_obj.rd_enbl = 1;
			trans_obj.wr_enbl = 1;
			vintf.mem_cb.wr_enbl <= 1;
			vintf.mem_cb.wr_addr <= trans_obj.wr_addr;
			vintf.mem_cb.wr_data <= trans_obj.wr_data;
			vintf.mem_cb.rd_enbl <= 1;
			vintf.mem_cb.rd_addr <= trans_obj.rd_addr;
		end
		endcase
    //$display($time, "driver");
    trans_obj.print_trans("driver");
    end
    end
	endtask
endclass
`endif
