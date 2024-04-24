//////////////////////////////////////////////////
//
//Project: layered testbench of dualport RAM
//
//
//
//
//
//Date: 	 23rd april, 2024
//
//////////////////////////////////////////////////

//RAM transaction class

//enum type variable to select operation type
typedef enum {WRITE, READ, WRITE_READ} operation;

class mem_trans #(byte DWIDTH = 8, byte AWIDTH = 8 );

	// enum to determine operation 
	//ops value
	//WRITE: write operation
	//READ: read operation
	//WRITE_READ: simultaneous read write operation
	rand operation ops;

	//write read address 
	rand bit [AWIDTH-1:0] wr_addr, rd_addr;
	//write data 
	rand bit [DWIDTH-1:0] wr_data;

	//output read data of memory
	bit [DWIDTH-1:0] rd_data;
	constraint c1 { wr_addr == rd_addr ;}

endclass
