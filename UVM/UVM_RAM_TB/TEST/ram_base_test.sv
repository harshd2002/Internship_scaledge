////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_base_test.sv
//File_Path    : 
//Class_Name   : ram_base_test               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_base_test extends uvm_test;

  `uvm_component_utils(ram_base_test)

  ram_env env_h;
//  ram_base_seqs seq_h;

  function new(string name="ram_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = ram_env::type_id::create("env_h", this);
//    seq_h = ram_base_seqs::type_id::create("seq_h", this);
  endfunction
/*run phase task created initially
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_h.start(env_h.agt_h.trans_item);
    #200;
    phase.drop_objection(this);
  endtask
*/
endclass
