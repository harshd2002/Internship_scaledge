////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_trans.sv
//description: transaction class
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//RAM transaction class

//enum type variable to select operation type
//typedef enum {WRITE, READ, WRITE_READ} operation;

`ifndef RAM_TRANSACTION
`define RAM_TRANSACTION

class mem_trans #(byte DWIDTH = 8, byte AWIDTH = 8 );

	//enum to determine operation 
	//ops value
	//WRITE: write operation
	//READ: read operation
	//WRITE_READ: simultaneous read write operation
	rand operation ops_e;

	//write read address 
	randc bit [AWIDTH-1:0] wr_addr, rd_addr;
	//write data 
	rand bit [DWIDTH-1:0] wr_data;
	//enable signals
	bit wr_enbl, rd_enbl;
	//output read data of memory
	bit [DWIDTH-1:0] rd_data;

  //constraint for reset
  constraint rst_c { ops_e != RESET; }
	//print data
	task print_trans(string block);
		$display("-------------------%0s class-------------------", block);
		$display("Time\t|\tName\t\t|\tValue");
		$display("-------------------------------------------------------");
		$display("%0t\t|\twr_enbl\t\t|\t%0d", $time, wr_enbl);
		$display("%0t\t|\trd_enbl\t\t|\t%0d", $time, rd_enbl);
		$display("%0t\t|\twr_addr\t\t|\t%0d", $time, wr_addr);
		$display("%0t\t|\trd_addr\t\t|\t%0d", $time, rd_addr);
		$display("%0t\t|\twr_data\t\t|\t%0d", $time, wr_data);
		$display("%0t\t|\trd_data\t\t|\t%0d", $time, rd_data);
		$display("-------------------------------------------------------");
	endtask

endclass
`endif
