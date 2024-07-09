////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_base_seqs.sv
//File_Path    : 
//Class_Name   : ram_base_seqs               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_base_seqs extends uvm_sequence #(ram_seqs_item);
  //factory registration
  `uvm_object_utils(ram_base_seqs)

  //sequence item handle
  ram_seqs_item req;

  //queue to store multiple address
  bit [7:0] addr_q[$];

  //variable to store numbe of transactions
  rand int unsigned no_of_itr;
	
  constraint NO_ITR {soft no_of_itr == 30;}
  
  function new(string name = "ram_base_seqs");
    super.new(name);
  endfunction
/*  task body created initially
  task body();
    repeat(10) begin
      `uvm_create(trans_item)
      trans_item.randomize() with {op_e == WRITE;wr_addr < 16; wr_addr == rd_addr;};
      start_item(trans_item);
      `uvm_info("SEQUENCE", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
      finish_item(trans_item);
      `uvm_info("SEQUENCE", $sformatf("item_done in sanity sequence"), UVM_LOW);
      trans_item.op_e = READ;
      start_item(trans_item);
      `uvm_info("SEQUENCE", $sformatf("trans_item = %0p", trans_item), UVM_LOW);
      trans_item.print();
      finish_item(trans_item);
      `uvm_info("SEQUENCE", $sformatf("item_done in sanity sequence"), UVM_LOW);
    end
  endtask
*/
endclass
