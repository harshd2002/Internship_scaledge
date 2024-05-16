////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: pkg_global.sv
//description: package for global variable declaration 
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM global variables

`ifndef RAM_DEFINE
`define RAM_DEFINE
//package pkg_global;
	//enum type variable to select operation type
	typedef enum bit [1:0] {RESET, WRITE, READ, WRITE_READ} operation;
  int unsigned num_itr = 5;
	event item_done;
	event reset_done;
  parameter SKEW_DEL = 8;

	//task to print values
	/*task print(mem_trans trans_obj);
		$display("-------------------------------------------------------");
		$display("time\tname\t\tvalue");
		$display("%0d\twr_enbl\t\t%0d", $time, vintf.wr_enbl);
		$display("%0d\trd_enbl\t\t%0d", $time, vintf.rd_enbl);
		$display("%0d\twr_addr\t\t%0d", $time, vintf.wr_addr);
		$display("%0d\trd_addr\t\t%0d", $time, vintf.rd_addr);
		$display("%0d\twr_data\t\t%0d", $time, vintf.wr_data);
		$display("%0d\trd_data\t\t%0d", $time, vintf.rd_data);
		$display("-------------------------------------------------------");
	endtask
	*/
//endpackage
`endif
