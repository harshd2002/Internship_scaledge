////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_env.sv
//File_Path    : 
//Class_Name   : fifo_env               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

//environment class for Async FIFO

`ifndef AFIFO_ENVIRONMENT
`define AFIFO_ENVIRONMENT

class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)
  fifo_agent agt_h;
  fifo_scrbd scrbd_h;
//  fifo_vseqr vseqr_h;

  function new(string name="fifo_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt_h   = fifo_agent::type_id::create("agt_h", this);
    scrbd_h = fifo_scrbd::type_id::create("scrbd_h", this);
//    vseqr_h = fifo_vseqr::type_id::create("vseqr_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
//    vseqr_h.base_seqr_h = agt_h.base_seqr_h;
    agt_h.agent_analysis_port.connect(scrbd_h.scrbd_analysis_imp);
  endfunction

endclass

`endif
