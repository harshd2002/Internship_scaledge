
class test extends uvm_test;
  
  `uvm_component_utils(test)

  enviroment obj_env;
  
  int var_test_a = 10;

  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    obj_env = enviroment::type_id::create("obj_env",this);
    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(10)
    );
    `uvm_info("BUILD_PHASE --> TEST",$sformatf("set in TEST: %0d ", var_test_a),UVM_HIGH)
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)

/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_test_a)
    );
*/  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)
	  uvm_top.print_topology(); // FOR PRINTING TOPOLOGY
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(var_test_a)
      );
*/  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
/*    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_test_a)
    );
*/    `uvm_info("START_OF_SIMULATION_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    uvm_config_db#(int)::set(.cntxt(this),
                             .inst_name("*"),
                             .field_name("int_var"),
                             .value(var_test_a)
    );
    `uvm_info("RUN_PHASE --> TEST",$sformatf(" SET in TEST: %0d ", var_test_a),UVM_NONE)
    #10;
    phase.drop_objection(this);
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(var_test_a)
      );
*/  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(var_test_a)
      );
*/  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("REPORT_PHASE --> TEST",$sformatf(" FROM TEST "),UVM_HIGH)
/*    uvm_config_db#(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(var_test_a)
      );
*/  endfunction

endclass
