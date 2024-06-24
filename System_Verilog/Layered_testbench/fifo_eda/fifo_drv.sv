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
	fifo_trans trans_h, wr_trans_h, rd_trans_h;
	
  //mailbox to get data from generator
	mailbox #(fifo_trans) gen_drv;
	
  //virtual interface to connect with original interface (fifo_intf)
	virtual fifo_intf vintf;

  //queue for storing read and write operations
  fifo_trans wr_que[$];
  fifo_trans rd_que[$];

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
    end
  endtask

  //task to drive at write clock
  task wr_driver();
    forever @(posedge `WR_DRV) begin
      $display($time, " :write driver started");
      if((wr_que.size()!=0) && (vintf.rstn) && ((!`WR_DRV.full) | (override_flag))) begin
      $display($time, " :write driver driving %0h ", wr_que[0].wr_data);
        `WR_DRV.wr_data <= wr_que[0].wr_data;
        `WR_DRV.wr_enbl <= 1;
        wr_que.pop_front();
      end
      else begin
        `WR_DRV.wr_enbl <= 0;
      end
      $display($time, " :write driver ended");
    end
  endtask

  //task to drive at read clock
  task rd_driver();
    forever @(posedge `RD_DRV) begin
      $display($time, " :read driver started");
      if((rd_que.size()!=0) && (vintf.rstn) && ((!`RD_DRV.empty) | (override_flag))) begin
      $display($time, " :read driver driving");
        `RD_DRV.rd_enbl <= 1; 
        rd_que.delete(0); 
      end
      else
        `RD_DRV.rd_enbl <= 0;
      $display($time, " :read driver ended");
    end 
  endtask 

  //converting transaction level data to pin level 
  task run(); 
    vintf.wr_enbl <= 0; 
    vintf.rd_enbl <= 0; 
    vintf.wr_data <= 0; 
    wait(vintf.rstn); 
    fork 
      wr_driver(); 
      rd_driver(); 
      forever begin 
        fork: driver_fork_join 
          begin 
           @(negedge vintf.rstn); 
          end 
          begin 
            gen_drv.get(trans_h); 
            object_raise();
            trans_h.print_trans("driver"); 
            if(trans_h.ops_e == WRITE) 
              wr_que.push_back(trans_h); 
            if(trans_h.ops_e == READ) 
              rd_que.push_back(trans_h);

            if(wr_que.size() == WR_COUNT) begin
              wait(!wr_que.size());
              @(`WR_DRV);
            end
            if(rd_que.size() == RD_COUNT) begin
              wait(!rd_que.size());
              @(`RD_DRV);
            end
          end
        join_any
        disable driver_fork_join;
        reset_n();
        object_drop(); 
      end
    join
	endtask

endclass
`endif

