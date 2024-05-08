	`include "ram_define.sv"
	`include "ram_intf.sv"
package ram;
	event item_done;
	
	int no_of_trans = 50;
	`include "ram_trans.sv"
	`include "ram_gen.sv"
	`include "ram_drv.sv"
	`include "ram_mon.sv"
	`include "ram_refm.sv"
	`include "ram_env.sv"
	
	//testcase
	`include "ram_lrng_data_xtn.sv"
	`include "ram_hrng_data_xtn.sv"

	
	`include "ram_test.sv"
	//reset task in package
	//
endpackage 
