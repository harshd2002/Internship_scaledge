`include "uvm_macros.svh"
import uvm_pkg::*;

class sub_class extends uvm_object;
  int sub_var;
//  `uvm_object_utils(sub_class)

  `uvm_object_utils_begin(sub_class)
  `uvm_field_int(sub_var, UVM_ALL_ON)
  `uvm_object_utils_end

endclass

class factory_reg extends uvm_object;
  int addr;
  byte strobe;
  integer data;
  string name;
  sub_class obj_sub_class = sub_class::type_id::create("obj_sub_class");

  `uvm_object_utils_begin(factory_reg)
    `uvm_field_int(addr, UVM_ALL_ON | UVM_NOCOPY)
    `uvm_field_int(strobe, UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(data, UVM_ALL_ON | UVM_NODEFPRINT)
    `uvm_field_string(name, UVM_ALL_ON | UVM_STRING)
    `uvm_field_object(obj_sub_class, UVM_ALL_ON)
//    `uvm_field_int(obj_sub_class.sub_var, UVM_ALL_ON)
  `uvm_object_utils_end

  function void data_store(int data1, byte data2, integer data3);
    addr = data1;
    strobe = data2;
    data = data3;
    obj_sub_class.sub_var = data1;
  endfunction

endclass

module uvm_example_1();

  factory_reg obj_h1, obj_copy_h1, obj_clone_h1;
  sub_class obj_sub_class_h1;

  initial begin
    obj_h1 = factory_reg::type_id::create("obj_h1");
    obj_copy_h1 = factory_reg::type_id::create("obj_copy_h1");
//    obj_sub_class_h1 = sub_class::type_id::create("obj_sub_class_h1");

    obj_h1.data_store(255, 127, 159);
    obj_h1.name = "UVM_example_1";

//    obj_sub_class_h1.sub_var = 32;

    obj_copy_h1.copy(obj_h1);
    $cast(obj_clone_h1,obj_h1.clone());
//    obj_clone_h1 = factory_reg'(obj_h1.clone());

//    obj_sub_class_h1.print();
    obj_h1.print();
    obj_copy_h1.print();
    obj_clone_h1.print();
    $display("original object: %0d, subclass object: %0d", obj_h1, obj_h1.obj_sub_class);
    $display("copied object: %0d, subclass object: %0d", obj_copy_h1, obj_copy_h1.obj_sub_class);
    $display("clonned object: %0d, subclass object: %0d", obj_clone_h1, obj_clone_h1.obj_sub_class);

    obj_copy_h1.name = "UVM_copy_example";
    obj_copy_h1.data_store(0, 1, 2);
    obj_clone_h1.name = "UVM_clone_example";
    obj_clone_h1.data_store(3, 4, 5);

    obj_h1.print();
    obj_copy_h1.print();
    obj_clone_h1.print();
    $display("original object: %0d, subclass object: %0d", obj_h1, obj_h1.obj_sub_class);
    $display("copied object: %0d, subclass object: %0d", obj_copy_h1, obj_copy_h1.obj_sub_class);
    $display("clonned object: %0d, subclass object: %0d", obj_clone_h1, obj_clone_h1.obj_sub_class);

  end

endmodule
