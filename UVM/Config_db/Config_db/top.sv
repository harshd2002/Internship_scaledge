
import uvm_pkg::*;
`include "uvm_macros.svh"

module top();

`include "sequence_item.sv"
//`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "enviroment.sv"
`include "test.sv"

  int var_top_a;

  initial begin 
    `uvm_info("",$sformatf("Starting FROM TOP "),UVM_HIGH)
    var_top_a = 5;
    `uvm_info("TOP",$sformatf("calling run_test() from top "),UVM_HIGH)
    fork
    run_test("test");
   /* uvm_config_db #(int)::set(.cntxt(this),
                               .inst_name("*"),
                               .field_name("int_var"),
                               .value(var_top_a)
      );
   */ join
  end

endmodule
