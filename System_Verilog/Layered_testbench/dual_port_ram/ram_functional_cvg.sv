////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_mon.sv
//description: monitor class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM monitor class

`ifndef RAM_FUNCTIONAL_COVERAGE
`define RAM_FUNCTIONAL_COVERAGE

class mem_functional_cvg;
  //transaction class handle
  transaction trans_obj = new();

  covergroup transaction;

  endgroup

endclass
`endif