


	class env extends uvm_env;

   // Factory Registration
	`uvm_component_utils(env)

//object handle created for ram_agent
 	ram_agent agnth;

//----------------------------------------

// Standard UVM Methods:
extern function new(string name = "env",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

endclass
	

   	function env::new(string name="env",uvm_component parent);
		super.new(name,parent);
   	endfunction


    function void env::build_phase(uvm_phase phase);	
//create method used to update the info in uvm register with object name "agnth" and object belongs to which parent as "this" refers to current class "ram_agent".
	  agnth = ram_agent::type_id::create("agnth",this);
	  `uvm_info("env","THIS IS BUILD PHASE OF agt_top",UVM_MEDIUM)
	  //`uvm_error("env","THIS IS BUILD PHASE OF agt_top")
 	endfunction
   
	
    function void env::connect_phase(uvm_phase phase);
	  `uvm_info("env","THIS IS CONNECT PHASE OF agt_top",UVM_MEDIUM)
	  //`uvm_info("env","THIS IS CONNECT PHASE OF agt_top",UVM_LOW)
	  //`uvm_error(get_name(),"THIS IS BUILD PHASE OF agt_top")
   	endfunction

	function void env::end_of_elaboration_phase(uvm_phase phase);
	  `uvm_info(get_type_name(),"THIS IS AN END OF ELABORATION OF agt_top",UVM_LOW)
   	endfunction

  
    function void env::start_of_simulation_phase(uvm_phase phase);
 	  `uvm_info(get_type_name(),"THIS IS START OF SIMULATION OF agt_top",UVM_LOW)
    endfunction

    task env::run_phase(uvm_phase phase);
      //uvm_test_done.raise_objection(this);
	  //#10;
	  `uvm_info(get_type_name(),"THIS IS RUN PHASE OF agt_top",UVM_LOW)
      //uvm_test_done.drop_objection(this);
   	endtask

 	function void env::extract_phase(uvm_phase phase);
	  `uvm_info(get_type_name(),"THIS IS EXTRACT PHASE OF agt_top",UVM_LOW)
   	endfunction


 	function void env::check_phase(uvm_phase phase);
	  `uvm_info(get_type_name(),"THIS IS CHECK PHASE OF agt_top",UVM_LOW)
   	endfunction


	 function void env::report_phase(uvm_phase phase);
	   `uvm_info(get_type_name(),"THIS IS REPORT PHASE OF agt_top",UVM_LOW)
   	 endfunction
   


