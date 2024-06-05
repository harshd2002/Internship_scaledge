`include "uvm_macros.svh"
import uvm_pkg::*;

class pack_unpack extends uvm_object;
  rand int data1;
  rand byte data2;
  rand bit [2:0] data3;

  `uvm_object_utils_begin(pack_unpack)
    `uvm_field_int(data3, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(data1, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(data2, UVM_ALL_ON | UVM_HEX)
  `uvm_object_utils_end

endclass

module uvm_example_3();

  pack_unpack obj_h1, obj_bit_unpack, obj_byte_unpack, obj_int_unpack;

  bit           bit_arr[];
  byte unsigned byte_arr[];
  int  unsigned int_arr[];

  initial begin
    obj_h1 = pack_unpack::type_id::create("obj_h1");
    obj_bit_unpack = pack_unpack::type_id::create("obj_bit_unpack");
    obj_byte_unpack = pack_unpack::type_id::create("obj_byte_unpack");
    obj_int_unpack = pack_unpack::type_id::create("obj_int_unpack");
    obj_h1.randomize();
    obj_h1.print();

    obj_h1.pack(bit_arr);
    obj_h1.pack_bytes(byte_arr);
    obj_h1.pack_ints(int_arr);

//    foreach(bit_arr[i])
    $display("bit array: %p", bit_arr);
    foreach(byte_arr[i])
    $display("byte array: %b", byte_arr[i]);
    foreach(int_arr[i])
    $display("int array: %b", int_arr[i]);

    obj_bit_unpack.unpack(bit_arr);
    obj_bit_unpack.print(uvm_default_table_printer);
    
    obj_byte_unpack.unpack_bytes(byte_arr);
    obj_byte_unpack.print(uvm_default_tree_printer);

    obj_int_unpack.unpack_ints(int_arr);
    obj_int_unpack.print(uvm_default_line_printer);

  end

endmodule
