////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_agent.sv
//File_Path    : 
//Class_Name   : fifo_agent               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

//agent class of Async FIFO

`ifndef AFIFO_AGENT
`define AFIFO_AGENT

class fifo_agent extends uvm_agent;
  
  `uvm_component_utils(fifo_agent)

  uvm_analysis_port #(fifo_seqs_item) agent_analysis_port;

  fifo_mon mon_h;
  fifo_driver drv_h;
  fifo_base_seqr base_seqr_h;

  function new(string name="fifo_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_analysis_port = new("agent_analysis_port", this);
    mon_h = fifo_mon::type_id::create("mon_h", this);
    drv_h = fifo_driver::type_id::create("drv_h", this); 
    base_seqr_h = fifo_base_seqr::type_id::create("base_seqr_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon_h.mon_analysis_port.connect(agent_analysis_port);
    drv_h.seq_item_port.connect(base_seqr_h.seq_item_export);
  endfunction

endclass

`endif
