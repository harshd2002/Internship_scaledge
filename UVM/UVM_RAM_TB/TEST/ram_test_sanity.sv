////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_test_sanity.sv
//File_Path    : 
//Class_Name   : ram_test_sanity               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_test_sanity extends ram_base_test;

  `uvm_component_utils(ram_test_sanity)

  //taking sanity sequence handle
  ram_seqs_wr_rd seqs_wr_rd_h;

  function new(string name="ram_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqs_wr_rd_h = ram_seqs_wr_rd::type_id::create("seqs_wr_rd_h", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    if(!seqs_wr_rd_h.randomize() with {no_of_itr == 2;})
      `uvm_error("TEST_SANITY", "Number of iterations is not randomized.")
    seqs_wr_rd_h.start(env_h.agt_h.base_seqr_h);
    #20;
    phase.drop_objection(this);
  endtask
endclass
