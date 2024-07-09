class driver extends uvm_driver;
  
  `uvm_component_utils(driver)
  
  int var_driver_a, var_b;

  function new(string name = "driver", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("BUILD_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("CONNECT_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );
    uvm_config_db#(int)::set(.cntxt(null),
                         .inst_name("*"),
                         .field_name("int_var_drv_agt"),
                         .value(25)
  );

    `uvm_info("CONNECT_PHASE --> DRIVER",$sformatf(" getting in driver : %0d ",var_driver_a),UVM_NONE)

  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("END_OF_ELABORATION_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_variables"),
                             .value(var_b)
    );

    `uvm_info("END_OF_ELABORATION_PHASE --> DRIVER",$sformatf(" %0d ",var_b),UVM_NONE)

  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("START_OF_SIMULATION_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("START_OF_SIMULATION_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)

  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    uvm_config_db #(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("RUN_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)

    #5;
    `uvm_info("RUN_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_NONE)
    phase.drop_objection(this);
  endtask

  virtual task reset_phase(uvm_phase phase);
    `uvm_info("reset sub_phase", "reset phase started", UVM_NONE)
  endtask

  virtual task configure_phase(uvm_phase phase);
    `uvm_info("configure sub_phase", "Configure phase started", UVM_NONE)
  endtask

  virtual task main_phase(uvm_phase phase);
    #2;
    `uvm_info("main sub_phase", "Main phase started", UVM_NONE)
  endtask

  virtual task shutdown_phase(uvm_phase phase);
    `uvm_info("shutdown sub_phase", "shutdown phase started", UVM_NONE)
  endtask

  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
     `uvm_info("EXTRACT_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db #(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("EXTRACT_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)

  endfunction

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
     `uvm_info("CHECK_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("CHECK_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)

  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
     `uvm_info("REPORT_PHASE --> DRIVER",$sformatf(" FROM DRIVER "),UVM_HIGH)
    uvm_config_db#(int)::get(.cntxt(this),
                             .inst_name(""),
                             .field_name("int_var"),
                             .value(var_driver_a)
    );

    `uvm_info("REPORT_PHASE --> DRIVER",$sformatf(" %0d ",var_driver_a),UVM_NONE)

  endfunction

endclass
