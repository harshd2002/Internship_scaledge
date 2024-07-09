////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_base_test.sv
//File_Path    : 
//Class_Name   : fifo_base_test               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_BASE_TEST
`define AFIFO_BASE_TEST

class fifo_base_test extends uvm_test;

  `uvm_component_utils(fifo_base_test)

  fifo_env env_h;

  function new(string name="fifo_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = fifo_env::type_id::create("env_h", this);
  endfunction

endclass

`endif
