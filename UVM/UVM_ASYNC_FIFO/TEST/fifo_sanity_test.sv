////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_sanity_test.sv
//File_Path    : 
//Class_Name   : fifo_sanity_test               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_SANITY_TEST
`define AFIFO_SANITY_TEST

class fifo_sanity_test extends fifo_base_test;

  `uvm_component_utils(fifo_sanity_test)

  fifo_write_seqs wr_seqs_h;
  fifo_read_seqs rd_seqs_h;

  function new(string name="fifo_sanity_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wr_seqs_h = fifo_write_seqs::type_id::create("wr_seqs_h");
    rd_seqs_h = fifo_read_seqs::type_id::create("rd_seqs_h");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    if(!wr_seqs_h.randomize() with {no_of_itr == 1;})
      `uvm_warning("SANITY_TEST", "Number of iterations is not randomized.")
    wr_seqs_h.start(env_h.agt_h.base_seqr_h);
    if(!rd_seqs_h.randomize() with {no_of_itr == 1;})
      `uvm_warning("SANITY_TEST", "Number of iterations is not randomized.")
    rd_seqs_h.start(env_h.agt_h.base_seqr_h);
    #50;
    phase.drop_objection(this);
  endtask

endclass

`endif

