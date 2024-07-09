class agent extends uvm_agent;
  
  `uvm_component_utils(agent)

  int var_agent_a = 20;
  int drv_agt;

  // Handles of driver, monitor and sequencer
  driver obj_driver;
  monitor obj_monitor;
  sequencer obj_seqr;

  function new(string name = "agent", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    obj_driver = driver::type_id::create("obj_driver",this);
    obj_monitor = monitor::type_id::create("obj_monitor",this);
    obj_seqr = sequencer::type_id::create("obj_seqr",this);
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(20)
      );
*/    `uvm_info("BUILD_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
    uvm_config_db#(int)::set(.cntxt(obj_driver),
                           .inst_name(""),
                           .field_name("int_variables"),
                           .value(22)
  );
   
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var_drv_agt"),
                             .value(drv_agt)
    );

    `uvm_info("END_OF_ELABORATION_PHASE --> AGENT",$sformatf(" %0d ",drv_agt),UVM_NONE)
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                           .inst_name("*"),
                           .field_name("int_var_drv_agt"),
                           .value(var_agent_a)
  );
*/   
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var_drv_agt"),
                             .value(drv_agt)
    );

    `uvm_info("END_OF_ELABORATION_PHASE --> AGENT",$sformatf(" %0d ",drv_agt),UVM_NONE)
  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("START_OF_SIMULATION_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_agent_a)
    );
*/  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    uvm_config_db#(int)::set(.cntxt(this),
                           .inst_name("*"),
                           .field_name("int_var"),
                           .value(var_agent_a)
  );
    `uvm_info("RUN_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_NONE)
    phase.drop_objection(this);
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_agent_a)
   );
*/  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_agent_a)
    );
*/  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
     `uvm_info("REPORT_PHASE --> AGENT",$sformatf(" FROM AGENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_agent_a)
    );
*/  endfunction

endclass
