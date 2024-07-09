////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_drv_cb.sv
//File_Path    : 
//Class_Name   : fifo_drv_cb               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_RD_DRIVER_CALLBACK
`define AFIFO_RD_DRIVER_CALLBACK

class fifo_drv_cb extends uvm_callback;
  
  function new(string name = "fifo_drv_cb");
    super.new(name);
  endfunction

  virtual task write_full(ref fifo_seqs_item wr_que[$]);
    virtual fifo_intf vintf;
    if(!uvm_config_db #(virtual fifo_intf)::get(null, "", "fifo_intf", vintf))
      `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),"vintf"});
    if(`WR_DRV.full && wr_que[0].wr_enb) begin
      `WR_DRV.wr_data <= wr_que[0].wr_data;
      `WR_DRV.wr_enb <= 1;
      wr_que.pop_front();
    end
  endtask

  virtual task read_empty(ref fifo_seqs_item rd_que[$]);
    virtual fifo_intf vintf;
    if(!uvm_config_db #(virtual fifo_intf)::get(null, "", "fifo_intf", vintf))
      `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),"vintf"});
    if(`RD_DRV.empty && rd_que[0].rd_enb) begin
      `RD_DRV.rd_enb <= 1;
      rd_que.pop_front();
    end
  endtask

endclass

`endif
