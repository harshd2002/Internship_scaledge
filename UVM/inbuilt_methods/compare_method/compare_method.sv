`include "uvm_macros.svh"
import uvm_pkg::*;

class sub_class extends uvm_object;
  int sub_var;
  `uvm_object_utils_begin(sub_class)
    `uvm_field_int(sub_var, UVM_ALL_ON)
  `uvm_object_utils_end
endclass

class compare_method extends uvm_object;
  int addr;
  byte strobe;
  integer data;
  string name;
  sub_class obj_sub_class = sub_class::type_id::create("obj_sub_class");

  `uvm_object_utils_begin(compare_method)
    `uvm_field_int(addr, UVM_ALL_ON | UVM_NOCOMPARE)
    `uvm_field_int(strobe, UVM_ALL_ON)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_string(name, UVM_ALL_ON)
    `uvm_field_object(obj_sub_class, UVM_ALL_ON)
  `uvm_object_utils_end

  function void data_store(int data1, byte data2, integer data3);
    addr = data1;
    strobe = data2;
    data = data3;
    obj_sub_class.sub_var = data1;
  endfunction

endclass

module uvm_example_2();
  compare_method obj_h1, obj_h2;
  
  initial begin
    obj_h1 = compare_method::type_id::create("obj_h1");
    obj_h2 = compare_method::type_id::create("obj_h2");
    obj_h1.data_store(255, 127, 159);
    obj_h1.name = "UVM_example_1";

    obj_h2.copy(obj_h1);

    if(!obj_h2.compare(obj_h1))
      $error("objects are not same");
    else
      $info("objects are same");

    obj_h1.print();
    obj_h2.print();
    $display("original object: %0d, subclass object: %0d", obj_h1, obj_h1.obj_sub_class);
    $display("copied object: %0d, subclass object: %0d", obj_h2, obj_h2.obj_sub_class);

    obj_h2.name = "UVM_copy_example";
    obj_h2.data_store(0, 1, 2);

    if(!obj_h2.compare(obj_h1))
      $error("objects are not same");
    else
      $info("objects are same");

    obj_h1.print();
    obj_h2.print();
    $display("original object: %0d, subclass object: %0d", obj_h1, obj_h1.obj_sub_class);
    $display("copied object: %0d, subclass object: %0d", obj_h2, obj_h2.obj_sub_class);

  end

endmodule
