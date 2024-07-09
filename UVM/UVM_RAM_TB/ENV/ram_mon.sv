////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_mon.sv
//File_Path    : 
//Class_Name   : ram_mon               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

// monitor class for RAM

class ram_mon extends uvm_monitor;

  `uvm_component_utils(ram_mon)

  virtual ram_intf vintf;
  
  uvm_analysis_port #(ram_seqs_item) mon_analysis_port;

  function new(string name="ram_mon", uvm_component parent=null);
    super.new(name, parent);
     if(!uvm_config_db#(virtual ram_intf)::get(this, "", "ram_intf", vintf))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_analysis_port = new("mon_analysis_port", this);
  endfunction

  task run_phase(uvm_phase phase);
    forever @(vintf.mon_mp.mon_cb) begin
      ram_seqs_item trans_item = ram_seqs_item::type_id::create("trans_item", this);
      pin_to_transaction(trans_item);
      mon_analysis_port.write(trans_item);
      `uvm_info("MONITOR", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
    end
  endtask

  task pin_to_transaction(output ram_seqs_item trans_item);
      trans_item = ram_seqs_item::type_id::create("trans_item", this);
    if(vintf.mon_mp.mon_cb.wr_enb)
      trans_item.op_e = WRITE;
    if(vintf.mon_mp.mon_cb.rd_enb)
      trans_item.op_e = READ;
    trans_item.ram_en  = vintf.mon_mp.mon_cb.ram_en;
    trans_item.wr_addr = vintf.mon_mp.mon_cb.wr_addr;
    trans_item.rd_addr = vintf.mon_mp.mon_cb.rd_addr;
    trans_item.wdata   = vintf.mon_mp.mon_cb.wr_data;
    trans_item.rdata   = vintf.mon_mp.mon_cb.rd_data;
  endtask

endclass
