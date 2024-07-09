////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_seqs_item.sv
//File_Path    : 
//Class_Name   : fifo_seqs_item               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_SEQS_ITEM
`define AFIFO_SEQS_ITEM

class fifo_seqs_item extends uvm_sequence_item;

  //input rand type write data
  rand bit [7:0] wr_data;

  //input write and read enable
  rand bit wr_enb, rd_enb;

  //output read data
  bit [7:0] rd_data;

  //output flags
  bit full, empty, almost_full, almost_empty, overflow, underflow;
       
  `uvm_object_utils_begin(fifo_seqs_item)    
    `uvm_field_int(wr_enb     , UVM_ALL_ON)
    `uvm_field_int(rd_enb     , UVM_ALL_ON)
    `uvm_field_int(wr_data    , UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rd_data    , UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(full       , UVM_ALL_ON)
    `uvm_field_int(empty      , UVM_ALL_ON)
    `uvm_field_int(almost_full , UVM_ALL_ON)
    `uvm_field_int(almost_empty, UVM_ALL_ON)
    `uvm_field_int(overflow   , UVM_ALL_ON)
    `uvm_field_int(underflow  , UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "fifo_seqs_item");
    super.new(name);
  endfunction
  
endclass

`endif
