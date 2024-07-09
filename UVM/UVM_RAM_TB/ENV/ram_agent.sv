////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_agent.sv
//File_Path    : 
//Class_Name   : ram_agent               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

//agent class 

class ram_agent extends uvm_agent;
  
  `uvm_component_utils(ram_agent)

  uvm_analysis_port #(ram_seqs_item) agent_analysis_port;

  ram_mon mon_h;
  ram_driver drv_h;
  ram_base_seqr base_seqr_h;

  function new(string name="ram_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent_analysis_port = new("agent_analysis_port", this);
    mon_h = ram_mon::type_id::create("mon_h", this);
    drv_h = ram_driver::type_id::create("drv_h", this); 
    base_seqr_h = ram_base_seqr::type_id::create("base_seqr_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon_h.mon_analysis_port.connect(agent_analysis_port);
    drv_h.seq_item_port.connect(base_seqr_h.seq_item_export);
  endfunction

endclass
