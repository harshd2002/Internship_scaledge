////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_wr_drv.sv
//description: write driver class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO write driver class

`ifndef FIFO_WRITE_DRIVER
`define FIFO_WRITE_DRIVER

class fifo_drv;
	//object of transaction class to store data
	fifo_trans trans_obj;
	//mailbox to get data from generator
	mailbox #(fifo_trans) gen_drv;
	//virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//connecting mailbox and virtual interface
	function connect(mailbox #(fifo_trans) gen_drv, virtual fifo_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
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
		    	vintf.wr_enbl <= 0;
		    	vintf.wr_data <= 0;
          $display($time, " :reset asserted");
          @(negedge vintf.rst)
          $display($time, " :reset deasserted");
        end: reset_b
        begin: drive_b
          @(vintf.fifo_cb_wr_drv)
		      gen_drv.peek(trans_obj);
		      $display($time," : driver: %0p", trans_obj);

		      //logic for pins
		      case(trans_obj.ops_e)
		      1: begin
		      	trans_obj.wr_enbl = 1;
		      	vintf.fifo_cb_wr_drv.wr_enbl <= 1;
		      	vintf.fifo_cb_wr_drv.wr_data <= trans_obj.wr_data;
		      end
		      2: begin
		      	trans_obj.wr_enbl = 0;
		      	vintf.fifo_cb_wr_drv.wr_enbl <= 0;
		      end
		      3: begin
		      	trans_obj.wr_enbl = 1;
		      	vintf.fifo_cb_wr_drv.wr_enbl <= 1;
		      	vintf.fifo_cb_wr_drv.wr_data <= trans_obj.wr_data;
		      end
		      endcase

          trans_obj.print_trans("wr_driver");
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
