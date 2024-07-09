
class sequencer extends uvm_sequencer;
  
  `uvm_component_utils(sequencer)

  int var_sequencer_a;

  function new(string name = "sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("START_OF_SIMULATION_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info("RUN_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
    phase.drop_objection(this);
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
     `uvm_info("REPORT_PHASE --> SEQUENCER",$sformatf(" FROM SEQUENCER "),UVM_HIGH)
  endfunction

endclass
