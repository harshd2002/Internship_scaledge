//////////////////////////////////////////////////////////
// 	HEADER Contains: All the Defines required in the code
//	FILE: ram_define.sv
//	PROJECT: RAM 16x8 Verification 
//
//////////////////////////////////////////////////////////


`ifndef RAM_DEFINES
`define RAM_DEFINES
	
//used defines in the testbench Env
`define ADDR_WIDTH 4
`define DATA_WIDTH 8
`define DEPTH 16

`endif

//ways for reset
//1. through event triggering
//wait for @(reset) in top when triggered call a task drive_Reset in top that is of top
//and whereever needed call this event from generator and it will trigger it.
//2. in package
//3. in interface 
