
	class ram_agent extends uvm_agent; 	 	

   // Factory Registration
	`uvm_component_utils(ram_agent)

 // Create the Driver handle
	driver drvh;
  driver drvh_new;
	
// Standard UVM Methods:
extern function new(string name = "ram_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

endclass

    function ram_agent::new(string name = "ram_agent",uvm_component parent);
		super.new(name,parent);
	endfunction


    function void ram_agent::build_phase(uvm_phase phase);	
	//create method used to update the info in uvm register with object name and object belongs to which parent as "this" refers to current class "driver".
    set_type_override_by_type(driver::get_type(), driver_2::get_type());
	  drvh=driver::type_id::create("drvh",this);
	  //drvh_new=driver::type_id::create("drvh_new",this);
	  `uvm_info("ram_agent","THIS IS BUILD IN AGENT",UVM_LOW)
 	endfunction
  
    function void ram_agent::connect_phase(uvm_phase phase);
      //`uvm_error("ram_agent","THIS IS CONNECT PHASE IN AGENT");
   endfunction


   function void ram_agent::end_of_elaboration_phase(uvm_phase phase);
      `uvm_info("ram_agent","THIS IS END_OF_ELABORATION PHASE IN AGENT",UVM_LOW);
   endfunction


   function void ram_agent::start_of_simulation_phase(uvm_phase phase);
      `uvm_info("ram_agent","THIS IS START_OF_SIMULATION PHASE IN AGENT",UVM_LOW);
   endfunction

   
	task ram_agent::run_phase(uvm_phase phase);
      `uvm_info("ram_agent","This is Run Phase",UVM_LOW)
    endtask

   function void ram_agent::extract_phase(uvm_phase phase);
      `uvm_info("ram_agent","This is Extract Phase",UVM_LOW)
   endfunction

   function void ram_agent::check_phase(uvm_phase phase);
      `uvm_info("ram_agent","This is Check Phase",UVM_LOW)
   endfunction

   function void ram_agent::report_phase(uvm_phase phase);
      `uvm_info("ram_agent","This is Report Phase",UVM_LOW)
   endfunction



