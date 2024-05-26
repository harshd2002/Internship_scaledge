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

class apb_trans;

	//enum to determine operation 
	//ops_e value
	//P_WRITE: to perform write opeation
  //P_READ:  to perform read operation

  //enum type variable
  rand operation ops_e;

	rand bit [31:0] Paddr, Pwdata;

  bit Pwrite;

  bit [31:0] Prdata;

  bit Pready, Pslverr;

  bit transfer;

	//print data
	task print_trans(string block);
		$display("-------------------------------------------------------------%0s class-------------------------------------------------------------", block);
		$display("---------------------------------------------------------------------------------------------------------------------------------------");
		$display("Time\t|\tPWRITE\t|\tPADDR\t|\tPWDATA\t|\tPRDATA\t|\tPREADY\t|\tPSLVERR\t|");
		$display("---------------------------------------------------------------------------------------------------------------------------------------");
		$display("%0t\t|\t%0d\t|\t%0d\t|\t%0d\t|\t%0d\t|\t%0d\t|\t%0d\t|",$time, Pwrite, Paddr, Pwdata, Prdata, Pready, Pslverr);
		$display("---------------------------------------------------------------------------------------------------------------------------------------");
	endtask

endclass

`endif
