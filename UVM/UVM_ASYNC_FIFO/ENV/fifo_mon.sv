////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_mon.sv
//File_Path    : 
//Class_Name   : fifo_mon               
//Project_Name : Asynchronous FIFO Verification
//Description  :
//
/////////////////////////////////////////////////

// monitor class for Async FIFO

`ifndef AFIFO_MONITOR
`define AFIFO_MONITOR

class fifo_mon extends uvm_monitor;

  `uvm_component_utils(fifo_mon)

  virtual fifo_intf vintf;
  
  uvm_analysis_port #(fifo_seqs_item) mon_analysis_port;

  fifo_seqs_item trans_item;

  function new(string name="fifo_mon", uvm_component parent=null);
    super.new(name, parent);
     if(!uvm_config_db #(virtual fifo_intf)::get(this, "", "fifo_intf", vintf))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),"vintf"});
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_analysis_port = new("mon_analysis_port", this);
  endfunction

  task run_phase(uvm_phase phase);
    wait(vintf.rstn);
    fork
      wr_mon();
      rd_mon();
      reset_n();
    join
  endtask

  //reset task 
  task reset_n();
    forever @(negedge vintf.rstn) begin
      trans_item = fifo_seqs_item::type_id::create("trans_item", this);
      trans_item.wr_enb       = 0;
      trans_item.rd_enb       = 0;
      trans_item.wr_data      = 0;
      trans_item.rd_data      = vintf.rd_data;
      trans_item.full         = vintf.full;
      trans_item.almost_full  = vintf.almost_full;
      trans_item.overflow     = vintf.overflow;
      trans_item.empty        = vintf.empty;
      trans_item.almost_empty = vintf.almost_empty;
      trans_item.underflow    = vintf.underflow;

      mon_analysis_port.write(trans_item);
      `uvm_info("MONITOR", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
    end
  endtask

  //write monitor task
  task wr_mon();
    forever @(`WR_MON) begin
    if(`WR_MON.wr_enb) begin
      `uvm_info("MONITOR", $sformatf("Write monitor started"), UVM_LOW);
      trans_item = fifo_seqs_item::type_id::create("trans_item", this);
      trans_item.wr_enb       = `WR_MON.wr_enb;
      trans_item.wr_data      = `WR_MON.wr_data;
      trans_item.full         = `WR_MON.full;
      trans_item.almost_full  = `WR_MON.almost_full;
      trans_item.overflow     = `WR_MON.overflow;
      trans_item.empty        = `WR_MON.empty;
      trans_item.almost_empty = `WR_MON.almost_empty;
      trans_item.underflow    = `WR_MON.underflow;

      mon_analysis_port.write(trans_item);
      `uvm_info("MONITOR", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
    end
    end
  endtask

  //read monitor task
  task rd_mon();
    forever @(`RD_MON) begin
    if(`RD_MON.rd_enb) begin
      `uvm_info("MONITOR", $sformatf("Read monitor started"), UVM_LOW);
      trans_item = fifo_seqs_item::type_id::create("trans_item", this);
      trans_item.rd_enb       = `RD_MON.rd_enb;
      trans_item.rd_data      = `RD_MON.rd_data;
      trans_item.full         = `RD_MON.full;
      trans_item.almost_full  = `RD_MON.almost_full;
      trans_item.overflow     = `RD_MON.overflow;
      trans_item.empty        = `RD_MON.empty;
      trans_item.almost_empty = `RD_MON.almost_empty;
      trans_item.underflow    = `RD_MON.underflow;

      mon_analysis_port.write(trans_item);
      `uvm_info("MONITOR", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
    end
    end
  endtask

endclass

`endif
