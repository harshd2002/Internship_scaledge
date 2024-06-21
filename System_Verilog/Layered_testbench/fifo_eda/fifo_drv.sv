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
	//mailbox #(fifo_trans) rd_gen_drv;
	
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
        `WR_DRV.wr_enbl <= 0;
        wait((wr_que.size()!=0) && (vintf.rstn) && (!`WR_DRV.full));
        `WR_DRV.wr_data <= wr_que[0].wr_data;
        `WR_DRV.wr_enbl <= 1;
        wr_que.pop_front();
    end
  endtask

  //task to drive at read clock
  task rd_driver();
    forever @(posedge `RD_DRV) begin
      $display($time, " :read driver started");
      `RD_DRV.rd_enbl <= 0;
      wait((rd_que.size()!=0) && (vintf.rstn) && (!`RD_DRV.empty));
      `RD_DRV.rd_enbl <= 1; 
      rd_que.delete(0); 
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
            wait((wr_que.size() + rd_que.size()) < TRANS_LIM);
            gen_drv.get(trans_h); 
            object_raise();
            trans_h.print_trans("driver"); 
            if(trans_h.ops_e == WRITE) 
              wr_que.push_back(trans_h); 
            if(trans_h.ops_e == READ) 
              rd_que.push_back(trans_h);
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

