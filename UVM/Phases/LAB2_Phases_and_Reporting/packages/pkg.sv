package pkg;

  // include the uvm_macros.svh
	`include "uvm_macros.svh"
	
   // import the UVM package
  	import uvm_pkg::*; 
	
	//int count;
    //int report_arr [string];
	
    //`include "my_report_server.sv"
	`include "../env/trans_with_macros.sv"
	`include "../env/driver.sv"
	`include "../env/agent.sv"
	`include "../env/env.sv"
	`include "../test/test.sv"

endpackage
