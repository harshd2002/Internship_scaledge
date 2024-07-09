

class driver extends uvm_driver;

   // Factory Registration
   	`uvm_component_utils(driver)

// Standard UVM Methods:
extern function new(string name = "driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

endclass

//construction of component (sends name "driver" and its parent which will point to the parent class)
	function driver::new(string name="driver",uvm_component parent);	
		super.new(name,parent); //*****//
	endfunction 

//build_phase
   	function void driver:: build_phase(uvm_phase phase);
		super.build_phase(phase);
	`uvm_info("DRIVER","THIS IS BUILD PHASE IN DRIVER",UVM_LOW)
	//`uvm_error("DRIVER","THIS IS START_OF_SIMULATION PHASE IN DRIVER")
	endfunction

//connect_phase
   	function void driver:: connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	`uvm_info("DRIVER","THIS IS CONNECT PHASE IN DRIVER",UVM_LOW)
	endfunction

//end_of_elaboration_phase
   	function void driver:: end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
	`uvm_info("DRIVER","THIS IS END_OF_ELABORATION PHASE IN DRIVER",UVM_LOW)
	endfunction    
 
//start_of_simulation_phase 
   	function void driver:: start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
	//`uvm_error("DRIVER","THIS IS START_OF_SIMULATION PHASE IN DRIVER")
	endfunction
	
//run_phase
    task driver:: run_phase(uvm_phase phase);
      `uvm_info("DRIVER","THIS IS RUN PHASE IN DRIVER", UVM_NONE)
    endtask

//extract_phase
 	function void driver:: extract_phase(uvm_phase phase);
	  //`uvm_error("DRIVER","THIS IS EXTRACT PHASE IN DRIVER")
   	endfunction

//check_phase
 	function void driver::check_phase(uvm_phase phase);
		super.check_phase(phase);
	  `uvm_info("DRIVER","THIS IS CHECK PHASE IN DRIVER",UVM_LOW)
   	endfunction

//report_phase
	 function void driver::report_phase(uvm_phase phase);
	  `uvm_info("DRIVER","THIS IS REPORT PHASE IN DRIVER",UVM_LOW)
   	 endfunction


  
   


