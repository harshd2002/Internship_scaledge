////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_driver.sv
//File_Path    : 
//Class_Name   : ram_driver               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_driver extends uvm_driver #(ram_seqs_item);

  //factory registration
  `uvm_component_utils(ram_driver)
  //registering callback class
  `uvm_register_cb(ram_driver, ram_drv_cb)  
  //ram_seqs_item req;
  virtual ram_intf vintf;
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual ram_intf)::get(this, "", "ram_intf", vintf))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),"vif"});
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    wait(!vintf.rst);
    forever @(vintf.drv_mp.drv_cb)begin
    vintf.drv_mp.drv_cb.wr_enb <= 0;
    vintf.drv_mp.drv_cb.rd_enb <= 0;
      seq_item_port.get_next_item(req);
      `uvm_info("DRIVER", $sformatf("req = %0p", req), UVM_LOW);
      req.print();
      drive();
      seq_item_port.item_done();
    end
  endtask
  
virtual task drive();
  if(req.op_e == WRITE)
    vintf.drv_mp.drv_cb.wr_enb <= 1;
  if(req.op_e == READ)
    vintf.drv_mp.drv_cb.rd_enb <= 1;
  `uvm_do_callbacks(ram_driver, ram_drv_cb, no_chip_select(req))
  vintf.drv_mp.drv_cb.ram_en <= req.ram_en;
  vintf.drv_mp.drv_cb.wr_addr <= req.wr_addr;
  vintf.drv_mp.drv_cb.rd_addr <= req.rd_addr;
  vintf.drv_mp.drv_cb.wr_data <= req.wdata;
endtask : drive
  
endclass 

