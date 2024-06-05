`include "uvm_macros.svh"
import uvm_pkg::*;

class factory_reg extends uvm_object;
  int addr;
  byte strobe;
  integer data;

  `uvm_object_utils(factory_reg)

/*  `uvm_object_utils_begin(factory_reg)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(strobe, UVM_ALL_ON | UVM_NOCOPY)
    `uvm_field_int(data, UVM_ALL_ON)
  `uvm_object_utils_end
*/
  function void data_store(int data1, byte data2, integer data3);
    addr = data1;
    strobe = data2;
    data = data3;
  endfunction

  function void do_copy (uvm_object rhs);
    factory_reg trans_h;
    $display("user defined copy method");

    if(!$cast(trans_h,rhs)) begin
      `uvm_fatal("do_copy","cast of the rhs failed")
    end
    super.do_copy(rhs);

    addr = trans_h.addr;
    data= trans_h.data;
    //strobe = trans_h.strobe;

  endfunction:do_copy

  //printer.print_field for integral properties
  function void do_print (uvm_printer printer);
    
     super.do_print(printer);   

    //                   srting name  bitstream value  size  radix for printing
    printer.print_field( "addr",       this.addr, 	    12,    UVM_HEX, , "int");
    printer.print_field( "strobe", 		 this.strobe, 	  8,		 UVM_BIN, , "byte");
	  printer.print_field( "data", 		   this.data, 	    64,	   UVM_DEC, , "integer");

  endfunction:do_print

endclass

module uvm_example_1();

  factory_reg obj_h1, obj_copy_h1;
  initial begin
    obj_h1 = factory_reg::type_id::create("obj_h1");
    obj_copy_h1 = factory_reg::type_id::create("obj_copy_h1");

    obj_h1.data_store(255, 127, 159);

    obj_copy_h1.copy(obj_h1);

    obj_h1.print();
    obj_copy_h1.print();
    $display("original object: %0d", obj_h1);
    $display("copied object: %0d", obj_copy_h1);

    obj_copy_h1.data_store(0, 1, 2);

    obj_h1.print();
    obj_copy_h1.print();
    $display("original object: %0d", obj_h1);
    $display("copied object: %0d", obj_copy_h1);

  end

endmodule
