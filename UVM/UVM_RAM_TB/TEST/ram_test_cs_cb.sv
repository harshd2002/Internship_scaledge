////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_test_cs_cb.sv
//File_Path    : 
//Class_Name   : ram_test_cs_cb               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_test_cs_cb extends ram_base_test;

  `uvm_component_utils(ram_test_cs_cb)

  //taking sanity sequence handle
  ram_seqs_wr_rd seqs_wr_rd_h;

  //callback handle
  ram_drv_cb drv_cs_cb_h;

  function new(string name="ram_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqs_wr_rd_h = ram_seqs_wr_rd::type_id::create("seqs_wr_rd_h");
    //drv_cs_cb_h = ram_drv_cb::type_id::create("drv_cs_cb_h");
    drv_cs_cb_h = new("drv_cs_cb_h");
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_callbacks #(ram_driver, ram_drv_cb)::add(env_h.agt_h.drv_h, drv_cs_cb_h);
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

