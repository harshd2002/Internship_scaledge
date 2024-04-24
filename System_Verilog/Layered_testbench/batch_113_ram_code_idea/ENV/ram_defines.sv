///////////////////////////////////
//
//      HEADER (file_name, author name, module/intreface/class name,
//              discription, version, date, time
//   FILE_NAME : 
//
/////////////////////////////////////

//Gaurd Statment to avoid multiple compilation of a file
`ifndef RAM_DEFINES_SV
`define RAM_DEFINES_SV
//typedef RAM_DEFINES_SV

`define ADDR_WIDTH 4
typedef enum bit [1:0] {IDLE, READ, WRITE, SIM_RW} trans_kind;

`endif
