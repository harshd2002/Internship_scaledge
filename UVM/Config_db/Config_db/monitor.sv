
class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)

  int var_monitor_a;

  function new(string name = "monitor", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
    /*
    uvm_config_db#(int)::set(.cntxt(null),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_monitor_a)
    );
    */
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("START_OF_SIMULATION_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info("RUN_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
    phase.drop_objection(this);
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
     `uvm_info("REPORT_PHASE --> MONITOR",$sformatf(" FROM MONITOR "),UVM_HIGH)
  endfunction

endclass
