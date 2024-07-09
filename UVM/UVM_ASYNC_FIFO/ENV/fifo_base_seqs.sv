////////////////////////////////////////////////
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_base_seqs.sv
//File_Path    : 
//Class_Name   : fifo_base_seqs               
//Project_Name : Asynhronous_FIFO
//Description  :
/////////////////////////////////////////////////

`ifndef AFIFO_BASE_SEQS
`define AFIFO_BASE_SEQS

class fifo_base_seqs extends uvm_sequence #(fifo_seqs_item);
  //factory registration
  `uvm_object_utils(fifo_base_seqs)

  //sequence item handle
  //fifo_seqs_item req;

  //variable to store number of transactions
  rand int unsigned no_of_itr;
	
  constraint NO_ITR {soft no_of_itr == 10;}
  
  function new(string name = "fifo_base_seqs");
    super.new(name);
  endfunction

endclass

`endif
