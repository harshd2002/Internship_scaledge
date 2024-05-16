

package pkg_1;
  
  event item_done;
  event reset_call;
  int no_of_trans;
	
  `include "transaction.sv"
	`include "generator.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "reference_model.sv"
	`include "scoreboard.sv"
	`include "environment.sv"

//-------TestCASES---------
  `include "test_1_extnd_sanitycheck.sv"

//----------Test-------------------
	`include "test.sv"
endpackage
