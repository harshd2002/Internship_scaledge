////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_drv.sv
//description: driver class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO driver class

`ifndef FIFO_DRIVER
`define FIFO_DRIVER

class fifo_drv;

	//object of transaction class to store data
	fifo_trans wr_trans_h, rd_trans_h;
	
  //mailbox to get data from generator
	mailbox #(fifo_trans) wr_gen_drv;
	mailbox #(fifo_trans) rd_gen_drv;
	
  //virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf vintf;

	//connecting mailbox and virtual interface
	function void connect(mailbox #(fifo_trans) wr_gen_drv, rd_gen_drv, virtual fifo_intf vintf);
		this.wr_gen_drv = wr_gen_drv;
    this.rd_gen_drv = rd_gen_drv;
		this.vintf = vintf;
	endfunction

  //task for reset
  task reset_n();
    if(!vintf.rstn) begin
      $display($time, " :Reset asserted");
      vintf.wr_enbl <= 0;
      vintf.rd_enbl <= 0;
      vintf.wr_data <= 0;
      @(posedge vintf.rstn)
      $display($time, " :Reset de-asserted");
    end
  endtask

  //task to drive write data
  task wr_driver();
    forever begin
          if(vintf.rstn) begin
          $display("write driver started");
            if(!`WR_DRV.overflow) begin
              wr_gen_drv.get(wr_trans_h);
              object_raise();
              @(vintf.wr_drv_mp.wr_drv_cb);
              `WR_DRV.wr_enbl <= wr_trans_h.wr_enbl;
              `WR_DRV.wr_data <= wr_trans_h.wr_data;
            end
            else begin
              wait(!`WR_DRV.full && !`WR_DRV.overflow)
              `WR_DRV.wr_enbl <= wr_trans_h.wr_enbl;
              `WR_DRV.wr_data <= wr_trans_h.wr_data;
            end
            object_drop();
          end
      reset_n();
    end
  endtask

  //task to drive read data
  task rd_driver();
    forever begin
      if(vintf.rstn) begin
      $display("read driver started");
        if(!`RD_DRV.underflow) begin
          rd_gen_drv.get(rd_trans_h);
          object_raise();
          @(vintf.rd_drv_mp.rd_drv_cb);
          `RD_DRV.rd_enbl <= rd_trans_h.rd_enbl;
        end
        else begin
          wait(!`RD_DRV.empty && !`RD_DRV.underflow)
          `RD_DRV.rd_enbl <= rd_trans_h.rd_enbl;
        end
        object_drop();
      end
      reset_n();
    end
  endtask

	//converting transaction level data to pin level
	task run();
  fork
    wr_driver();
    rd_driver();
  join
	endtask

endclass
`endif
