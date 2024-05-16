////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asunchronous FIFO verification
//File name: fifo_trans.sv
//description: transaction class
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//Async FIFO transaction class

//enum type variable to select operation type
//typedef enum {RESET, WRITE, READ, WRITE_READ} operation;

`ifndef FIFO_TRANSACTION
`define FIFO_TRANSACTION

class fifo_trans #(byte DWIDTH = 8, byte AWIDTH = 8 );

	//enum to determine operation 
	//ops value
	//WRITE: write operation
	//READ: read operation
	//WRITE_READ: simultaneous read write operation
	rand operation ops_e;

	//write data 
	rand bit [DWIDTH-1:0] wr_data;
	//enable signals
	bit wr_enbl, rd_enbl;
	//output read data of memory
	bit [DWIDTH-1:0] rd_data;
  bit full, empty, almost_full, almost_empty, overflow, underflow;

  constraint rst_cnst { ops_e != RESET; };
	//print data
  /*
	task print_trans(string block);
		$display("-------------------%0s class-------------------", block);
		$display("Time\t|\twr_wnb\t|\trd_wnb\t|\twr_data\t|\trd_data\t|\twr_data\t\t|\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\t|\twr_enbl\t\t|\t%0d", $time, wr_enbl);
		$display("%0d\t|\trd_enbl\t\t|\t%0d", $time, rd_enbl);
		$display("%0d\t|\twr_addr\t\t|\t%0d", $time, wr_addr);
		$display("%0d\t|\trd_addr\t\t|\t%0d", $time, rd_addr);
		$display("%0d\t|\twr_data\t\t|\t%0d", $time, wr_data);
		$display("%0d\t|\trd_data\t\t|\t%0d", $time, rd_data);
		$display("-------------------------------------------------------");
	endtask
  */

endclass
`endif
