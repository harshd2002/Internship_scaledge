////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_rd_drv.sv
//description: read driver class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO read driver class

`ifndef FIFO_READ_DRIVER
`define FIFO_READ_DRIVER

class fifo_drv;
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
    fork
    begin: reset_b
    $display("reset block");
      @(reset_done);
      disable drive_b;
			vintf.rd_enbl <= 0;
			vintf.rd_data <= 0;
      $display($time, " :reset asserted");
      @(negedge vintf.rst)
      $display($time, " :reset deasserted");
    end: reset_b
    begin: drive_b
    @(vintf.mem_cb)
		gen_drv.get(trans_obj);
		$display($time," : driver: %0p", trans_obj);

		//logic for pins
		case(trans_obj.ops_e)
		1: begin
			trans_obj.rd_enbl = 0;
			vintf.mem_cb.rd_enbl <= 0;
		end
		2: begin
			trans_obj.rd_enbl = 1;
			vintf.mem_cb.rd_enbl <= 1;
		end
		3: begin
			trans_obj.rd_enbl = 1;
			vintf.mem_cb.rd_enbl <= 1;
		end
		endcase
    trans_obj.print_trans("rd_driver");
    #SKEW_DEL -> item_done;
    disable reset_b;
    //end
    end: drive_b
    join
    //wait fork;
    end
	endtask
endclass
`endif
