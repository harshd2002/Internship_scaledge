
///// HEADER
// when you use one variable in more than one verification component class then
// better you declare it in transaction class
// when you use one variable in one verification component class 
//(within the class) only then
// better you declare it in that class itself (local)

//Gaurd Statment to avoid multiple compilation of a file
`ifndef RAM_TRANS_SV
`define RAM_TRANS_SV

class ram_trans;

   //declare atributtes rand or non-rand type
   
  //enum to set the transaction kind (direction)
  //kind_e value
  //WRITE  : write transaction
  //READ   : read transaction
  //SIM_RW : simulteous read write transaction
  rand trans_kind kind_e;
  
  //cooments
  rand bit [(`ADDR_WIDTH-1):0] wr_addr;
  
  :
  
  //write default constraint if needed
    
  //add static variables to record no. of write and read transaction
  
  //add custom print/display method to print transaction attributes
  
  
endclass

`endif

  
  