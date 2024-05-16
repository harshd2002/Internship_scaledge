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
	mem_trans trans_h;
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
        @(posedge vintf.rst);
        //$display("reset block");
        disable drive_b;
	   	  vintf.wr_enbl <= 0;
	   	  vintf.wr_addr <= 0;
	   	  vintf.wr_data <= 0;
	   	  vintf.rd_enbl <= 0;
	   	  vintf.rd_addr <= 0;
        $display($time, " :reset asserted");
        @(negedge vintf.rst)
        $display($time, " :reset deasserted");
      end: reset_b
      begin: drive_b
        @(vintf.mem_cb)
        if(!vintf.rst) begin
	      gen_drv.get(trans_h);
	      $display($time," : driver: %0p", trans_h);

	   //logic for pins
	   /*case(trans_h.ops_e)
	   1: begin
	   	trans_h.wr_enbl = 1;
	   	trans_h.rd_enbl = 0;
	   	vintf.mem_cb.wr_enbl <= 1;
	   	vintf.mem_cb.wr_addr <= trans_h.wr_addr;
	   	vintf.mem_cb.wr_data <= trans_h.wr_data;
	   	vintf.mem_cb.rd_enbl <= 0;
	   	vintf.mem_cb.rd_addr <= trans_h.rd_addr;
	   end
	   2: begin
   	trans_h.wr_enbl = 0;
	   	trans_h.rd_enbl = 1;
	   	vintf.mem_cb.wr_enbl <= 0;
	   	vintf.mem_cb.wr_addr <= trans_h.wr_addr;
	   	vintf.mem_cb.wr_data <= trans_h.wr_data;
	   	vintf.mem_cb.rd_enbl <= 1;
	   	vintf.mem_cb.rd_addr <= trans_h.rd_addr;
	   end
	   3: begin
	   	trans_h.rd_enbl = 1;
	   	trans_h.wr_enbl = 1;
	   	vintf.mem_cb.wr_enbl <= 1;
	   	vintf.mem_cb.rd_enbl <= 1;
	   end
	   endcase*/

	   vintf.mem_cb.wr_addr <= trans_h.wr_addr;
	   vintf.mem_cb.wr_data <= trans_h.wr_data;
	   vintf.mem_cb.rd_addr <= trans_h.rd_addr;
     $cast({trans_h.rd_enbl, trans_h.wr_enbl},trans_h.ops_e);
     $cast({vintf.mem_cb.rd_enbl, vintf.mem_cb.wr_enbl},trans_h.ops_e);
     trans_h.print_trans("driver");
     #SKEW_DEL -> item_done;
     //disable reset_b;
     end
     end: drive_b
    join_any
    disable fork;
    //wait fork;
    end
	endtask
endclass
`endif
