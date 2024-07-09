////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_driver.sv
//File_Path    : 
//Class_Name   : fifo_driver               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_DRIVER
`define AFIFO_DRIVER

class fifo_driver extends uvm_driver #(fifo_seqs_item);

  //factory registration
  `uvm_component_utils(fifo_driver)

  `uvm_register_cb(fifo_driver, fifo_drv_cb)

  //fifo_seqs_item req;
  virtual fifo_intf vintf;

  //queue for storing read and write operations
  fifo_seqs_item wr_que[$];
  fifo_seqs_item rd_que[$];
     
  function new (string name="fifo_driver", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db #(virtual fifo_intf)::get(this, "", "fifo_intf", vintf))
       `uvm_fatal("NO_VINTF",{"virtual interface must not be set for: ",get_full_name(),"vintf"});
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    wait(vintf.rstn);
    fork
      drive();
      wr_driver();
      rd_driver();
    join
  endtask
  
  //task for distributing packets
  virtual task drive();
      forever begin 
        fork: driver_fork_join 
          begin 
           @(negedge vintf.rstn); 
          end 
          begin 
            seq_item_port.get_next_item(req);
            `uvm_info("DRIVER", $sformatf("req = %0p", req), UVM_LOW);
            req.print();
            if(req.wr_enb) 
              wr_que.push_back(req); 
            if(req.rd_enb) 
              rd_que.push_back(req);
            seq_item_port.item_done();
            
            if((wr_que.size() == WR_COUNT) && (WR_COUNT)) begin 
              wait(!wr_que.size());
              @(`WR_DRV);
            end
            if((rd_que.size() == RD_COUNT) && (RD_COUNT)) begin
              wait(!rd_que.size());
              @(`RD_DRV);
            end
          end
        join_any
        disable driver_fork_join;
        reset_n();
      end
  endtask : drive

  //task for reset
  task reset_n();
    if(!vintf.rstn) begin
      `uvm_info("DRIVER", "Reset Asserted", UVM_LOW)
      vintf.wr_enb  = 0;
      vintf.rd_enb  = 0;
      vintf.wr_data = 0;
      wait(vintf.rstn);
      `uvm_info("DRIVER", "Reset De-asserted", UVM_LOW)
    end
  endtask: reset_n

  //task to drive at write clock
  task wr_driver();
    forever @(`WR_DRV) begin
      if((wr_que.size()) && (vintf.rstn) && (!`WR_DRV.full)) begin
        `uvm_info("DRIVER", $sformatf("Write driver started"), UVM_LOW);
        `WR_DRV.wr_data <= wr_que[0].wr_data;
        `WR_DRV.wr_enb <= 1;
        wr_que.pop_front();
      end
      else begin
        `WR_DRV.wr_enb <= 0;
      end
      `uvm_do_callbacks(fifo_driver, fifo_drv_cb, write_full(wr_que))
    end
  endtask

  //task to drive at read clock
  task rd_driver();
    forever @(`RD_DRV) begin
      if((rd_que.size()) && (vintf.rstn) && (!`RD_DRV.empty)) begin
        `uvm_info("DRIVER", $sformatf("Read driver started"), UVM_LOW);
        `RD_DRV.rd_enb <= 1; 
        rd_que.delete(0); 
      end
      else begin
        `RD_DRV.rd_enb <= 0;
      end
      `uvm_do_callbacks(fifo_driver, fifo_drv_cb, read_empty(rd_que))
    end 
  endtask 

endclass 

`endif
