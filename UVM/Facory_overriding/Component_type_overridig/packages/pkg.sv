

package pkg;

   // import the UVM package
  	import uvm_pkg::*; 
	
	//int count;
    //int report_arr [string];

  // include the uvm_macros.svh
	`include "uvm_macros.svh"
	
	
    //`include "my_report_server.sv"
	`include "trans_with_macros.sv"
	`include "driver.sv"
  `include "driver_2.sv"
	`include "agent.sv"
	`include "env.sv"
	`include "test.sv"

endpackage
