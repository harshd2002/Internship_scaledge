
class sequence_item extends uvm_sequence_item;

  rand int a;

  `uvm_object_utils_begin(sequence_item)
      `uvm_field_int(a,UVM_ALL_ON)
  `uvm_object_utils_end
  
 constraint val_a { a < 10;} 

endclass
