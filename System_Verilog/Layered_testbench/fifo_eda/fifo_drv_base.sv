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
  
  semaphore wr_sem = new(1);
  semaphore rd_sem = new(1);

	//object of transaction class to store data
	fifo_trans trans_h, wr_trans_h, rd_trans_h;
	
  //mailbox to get data from generator
	mailbox #(fifo_trans) gen_drv;
	//mailbox #(fifo_trans) rd_gen_drv;
	
  //virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf vintf;

	//connecting mailbox and virtual interface
	function void connect(mailbox #(fifo_trans) gen_drv, virtual fifo_intf vintf);
		this.gen_drv = gen_drv;
		this.vintf = vintf;
	endfunction

  //task for reset
  task reset_n();
    if(!vintf.rstn) begin
      $display($time, " :Reset asserted");
      vintf.wr_enbl <= 0;
      vintf.rd_enbl <= 0;
      vintf.wr_data <= 0;
      wait(vintf.rstn);
      $display($time, " :Reset de-asserted");
      wr_trans_h = new;
      rd_trans_h = new;
      -> wr_evt;
      -> rd_evt;
    end
  endtask

  //task to drive at write clock
  task wr_driver();
    forever @(`WR_DRV) begin
    if(vintf.rstn) begin
      wr_sem.get(1);
      object_raise();
      -> wr_evt;
      $display($time, " :write driver started");
      if(((rd_trans_h.ops_e == WRITE) || (rd_trans_h.ops_e == WRITE_READ)) && (!`WR_DRV.full)) begin
        wr_trans_h.print_trans("driver");
        `WR_DRV.wr_enbl <= 1;
        `WR_DRV.wr_data <= wr_trans_h.wr_data;
        if(!wr_trans_h.transfer) begin
          @(`WR_DRV);
          `WR_DRV.wr_enbl <= 0;
        end
      end
      wr_sem.put(1);
      object_drop();
      $display($time, " :write driver completed");
    end
    end
  endtask

  //task to drive at read clock
  task rd_driver();
    forever @(`RD_DRV) begin
    if(vintf.rstn) begin
      rd_sem.get(1);
      object_raise();
      -> rd_evt;
      $display($time, " :read driver started");
      if(((rd_trans_h.ops_e == READ) || (rd_trans_h.ops_e == WRITE_READ)) && (!`RD_DRV.empty)) begin
        rd_trans_h.print_trans("driver");
        `RD_DRV.rd_enbl <= 1;
        if(!rd_trans_h.transfer) begin
          @(`RD_DRV);
          `RD_DRV.rd_enbl <= 0;
        end
      end
      rd_sem.put(1);
      object_drop();
      $display($time, " :read driver completed");
    end
    end
  endtask

  ///run task to drive get packet
  task run();
    reset_n();
    fork
      forever begin
        fork: driver_fork_join
          begin 
            @(negedge vintf.rstn);
          end
          begin
            gen_drv.get(trans_h);
            fork: load_values
              begin
                $display($time, " :wr_driver getting key");
                wr_sem.get(1);
                wr_trans_h = new trans_h;
                wr_sem.put(1);
              end
              begin
                $display($time, " :rd_driver getting key");
                rd_sem.get(1);
                rd_trans_h = new trans_h;
                rd_sem.put(1);
              end
            join
          end
        join_any
        disable fork;
        reset_n();
      end
      wr_driver();
      rd_driver();
    join
  endtask

endclass
`endif

