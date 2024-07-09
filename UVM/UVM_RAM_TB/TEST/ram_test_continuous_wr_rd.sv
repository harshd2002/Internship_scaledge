////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_test_continuous_wr_rd.sv
//File_Path    : 
//Class_Name   : ram_test_continuous_wr_rd               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_test_continuous_wr_rd extends ram_base_test;

  `uvm_component_utils(ram_test_continuous_wr_rd)

  //taking virtual sequence handle
  ram_vseqs_continuous_wr_rd vseqs_cont_wr_rd_h;

  function new(string name="ram_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    vseqs_cont_wr_rd_h = ram_vseqs_continuous_wr_rd::type_id::create("vseqs_cont_wr_rd_h");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    vseqs_cont_wr_rd_h.start(env_h.vseqr_h);
    #20;
    phase.drop_objection(this);
  endtask
endclass
