////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB transaction class

`ifndef APB_TRANSACTION
`define APB_TRANSACTION

//enum type variable to select operation type
typedef enum {PWRITE, PREAD} operation;

class apb_trans;

	//enum to determine operation 
	//ops_e value
	//PWRITE: to perform write opeation
  //PREAD:  to perform read operation

  //enum type variable
  rand operation ops_e;

	rand bit [31:0] Paddr, Pwdata;

  bit Psel, Penable, Pwrite;

  bit [31:0] Prdata;

  bit Preset, Pslverr;
	

	//print data
	task print_trans(string block);
		$display("-----------------------------------------------%0s class-----------------------------------------------", block);
		$display("-------------------------------------------------------------------------------------------------------");
		$display("Time\t|\tPSEL\t|\tPENABLE\t|\tPWRITE\t|\t\tPADDR\t\t|\t\tPWDATA\t\t|\t\tPRDATA\t\t|\tPREADY\t|\tPSLVERR\t|");
		$display("-------------------------------------------------------------------------------------------------------");
		$display("%0t\t|\t%0d\t|\t%0d\t|\t%0d\t|\t\t%0d\t\t|\t\t%0d\t\t|\t\t%0d\t\t|\t%0d\t|\t%0d\t|",$time, PSEL, PENABLE, PWRITE,PADDR, PWDATA, PRDATA, PREADY, PSLVERR);
		$display("-------------------------------------------------------------------------------------------------------");
	endtask

endclass

`endif
