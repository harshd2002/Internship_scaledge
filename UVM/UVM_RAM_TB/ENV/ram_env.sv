////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_env.sv
//File_Path    : 
//Class_Name   : ram_env               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

//environment class for RAM

class ram_env extends uvm_env;
  `uvm_component_utils(ram_env)
  ram_agent agt_h;
  ram_scrbd scrbd_h;
  ram_vseqr vseqr_h;

  function new(string name="ram_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt_h = ram_agent::type_id::create("agt_h", this);
    scrbd_h = ram_scrbd::type_id::create("scrbd_h", this);
    vseqr_h = ram_vseqr::type_id::create("vseqr_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vseqr_h.base_seqr_h = agt_h.base_seqr_h;
    agt_h.agent_analysis_port.connect(scrbd_h.scrbd_analysis_imp);
  endfunction

endclass
