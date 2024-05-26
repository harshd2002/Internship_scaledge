////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
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
  //FIFO flags 
  bit full, empty, almost_full, almost_empty, overflow, underflow;
  //variable to store all the flags
  bit [5:0] flags;
  
  //constraint for not randomizing reset 
  constraint rst_cnst { ops_e != RESET;}

	//print data
	task print_trans(string block);
    flags = { full, empty, almost_full, almost_empty, overflow, underflow };
		$display("--------------------------%0s class-------------------------", block);
		$display("Time\t|\twr_enbl\t|\trd_enbl\t|\twr_data\t|\trd_data\t|\tFlags\t\t|");
		$display("-----------------------------------------------------------------");
		$display("%0t\t|\t%0b\t|\t%0b\t|\t%0h\t|\t%0h\t|\t%0b\t\t|", $time, wr_enbl, rd_enbl, wr_data, rd_data, flags);
		$display("-------------------------------------------------------------------");
	endtask

endclass
`endif
