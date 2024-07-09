
class driver_2 extends driver;

   // Factory Registration
   	`uvm_component_utils(driver_2)

// Standard UVM Methods:
extern function new(string name = "driver_2",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

endclass

//construction of component (sends name "driver_2" and its parent which will point to the parent class)
	function driver_2::new(string name="driver_2",uvm_component parent);	
		super.new(name,parent); //*****//
	endfunction 

//build_phase
   	function void driver_2:: build_phase(uvm_phase phase);
		//super.build_phase(phase);
	`uvm_info("DRIVER_2","THIS IS BUILD PHASE IN DRIVER_2",UVM_MEDIUM)
	//`uvm_error("DRIVER_2","THIS IS START_OF_SIMULATION PHASE IN DRIVER_2")
	endfunction

//connect_phase
   	function void driver_2:: connect_phase(uvm_phase phase);
		//super.connect_phase(phase);
	`uvm_info("DRIVER_2","THIS IS CONNECT PHASE IN DRIVER_2",UVM_MEDIUM)
	endfunction

//end_of_elaboration_phase
   	function void driver_2:: end_of_elaboration_phase(uvm_phase phase);
		//super.end_of_elaboration_phase(phase);
	`uvm_info("DRIVER_2","THIS IS END_OF_ELABORATION PHASE IN DRIVER_2",UVM_LOW)
	endfunction    
 
//start_of_simulation_phase 
   	function void driver_2:: start_of_simulation_phase(uvm_phase phase);
		//super.start_of_simulation_phase(phase);
	`uvm_info("DRIVER_2","THIS IS START_OF_SIMULATION PHASE IN DRIVER_2",UVM_LOW)
	//`uvm_error("DRIVER_2","THIS IS START_OF_SIMULATION PHASE IN DRIVER_2")
	endfunction
	
//run_phase
    task driver_2:: run_phase(uvm_phase phase);
      `uvm_info("DRIVER_2","THIS IS RUN PHASE IN DRIVER_2", UVM_NONE)
    endtask

//extract_phase
 	function void driver_2:: extract_phase(uvm_phase phase);
	  `uvm_info("DRIVER_2","THIS IS EXTRACT PHASE IN DRIVER_2",UVM_LOW)
	  //`uvm_error("DRIVER_2","THIS IS EXTRACT PHASE IN DRIVER_2")
   	endfunction

//check_phase
 	function void driver_2::check_phase(uvm_phase phase);
		//super.check_phase(phase);
	  `uvm_info("DRIVER_2","THIS IS CHECK PHASE IN DRIVER_2",UVM_LOW)
   	endfunction

//report_phase
	 function void driver_2::report_phase(uvm_phase phase);
	  `uvm_info("DRIVER_2","THIS IS REPORT PHASE IN DRIVER_2",UVM_LOW)
 	 endfunction


