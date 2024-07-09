////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_seqs_item.sv
//File_Path    : 
//Class_Name   : ram_seqs_item               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_seqs_item extends uvm_sequence_item;

  rand operation_e op_e;
  rand bit [7:0] wr_addr, rd_addr;
  rand bit [7:0] wdata;
  bit [7:0] rdata;
  bit ram_en;
       
  `uvm_object_utils_begin(ram_seqs_item)    
    `uvm_field_enum(operation_e, op_e, UVM_ALL_ON)
    `uvm_field_int(ram_en ,UVM_ALL_ON)
    `uvm_field_int(wr_addr ,UVM_ALL_ON)
    `uvm_field_int(rd_addr ,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON| UVM_DEC)
    `uvm_field_int(rdata,UVM_ALL_ON|UVM_DEC)
  `uvm_object_utils_end
  
  function new(string name = "ram_seqs_item");
    super.new(name);
  endfunction
  
endclass
