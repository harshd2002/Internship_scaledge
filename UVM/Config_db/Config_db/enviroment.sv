
class enviroment extends uvm_env;
  
  `uvm_component_utils(enviroment)

  agent obj_agent;

  int var_env_a=15;

  function new(string name = "enviroment", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    obj_agent = agent::type_id::create("obj_agent",this);
    `uvm_info("BUILD_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(15)
      );
*/  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)

/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_env_a)
    );
*/
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_env_a)
    );
*/  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("START_OF_SIMULATION_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
    uvm_config_db#(int)::set(.cntxt(this),
                           .inst_name("*"),
                           .field_name("int_var"),
                           .value(var_env_a)
  );
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    uvm_config_db#(int)::set(.cntxt(this),
                           .inst_name("*"),
                           .field_name("int_var"),
                           .value(var_env_a)
  );
    `uvm_info("RUN_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_NONE)
    phase.drop_objection(this);
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
    uvm_config_db#(int)::set(.cntxt(this),
                           .inst_name("*"),
                           .field_name("int_var"),
                           .value(var_env_a)
  );
  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_env_a)
    );
*/  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("REPORT_PHASE --> ENVIROMENT",$sformatf(" FROM ENVIROMENT "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_env_a)
    );
*/  endfunction

endclass
