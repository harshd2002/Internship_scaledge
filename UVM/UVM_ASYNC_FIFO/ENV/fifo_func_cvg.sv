////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_func_cvg.sv
//File_Path    : 
//Class_Name   : fifo_func_cvg               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_FUNCTIONAL_COVERAGE
`define AFIFO_FUNCTIONAL_COVERAGE

class fifo_func_cvg extends uvm_component;

  //factory registration
  `uvm_object_utils(fifo_func_cvg)

  //implementation port
  uvm_analysis_imp #(fifo_seqs_item, fifo_func_cvg) func_cvg_analysis_imp;

  fifo_seqs_item trans_h;

  function new(string name="fifo_func_cvg", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  //functional coverage for inputs
  covergroup fifo_input_cvg with function sample(fifo_trans trans_h);
    option.per_instance = 1;
    option.comment      = "cover_group for input signals of Async FIFO";
    
    OPERATION: coverpoint trans_h.ops_e {
      option.comment = "operation check";
      bins operation_write = {WRITE};
      bins operation_read = {READ};
    }
    OPER_TRANSITION: coverpoint trans_h.ops_e {
      option.comment = "operation transition check";
      bins back_to_back_wr_rd = (WRITE=>READ);
      bins back_to_back_rd_wr = (READ=>WRITE);
    }
    WRITE_DATA: coverpoint trans_h.wr_data {
      option.comment = "write data range check";
      bins write_data_range[4] = {[0:$]};
    }
    RESET_CHECK: coverpoint vintf.rstn {
      option.comment = " reset check ";
      bins reset_0 = {0};
      bins reset_1 = {1};
      bins reset_trans_0_1 = (0=>1);
      bins reset_trans_1_0 = (1=>0);
    }
  endgroup

  //coverage for toggle check
  covergroup bits_toggle_check with function sample (bit toggle_bit);
    option.per_instance = 1;
    option.comment = "covergroup to check toggle of bits";
    TOGGLE: coverpoint toggle_bit {
      bins bit_transition_0_1 = (0=>1);
      bins bit_transition_1_0 = (1=>0);
    }
  endgroup

  //coverage for output signals
  covergroup fifo_output_cvg with function sample(bit [7:0] read_data, bit full, empty, almostfull, almostempty, overflow,underflow);
    option.per_instance = 1;
    option.comment = "cover_group for output signals of Async FIFO";

    READ_DATA: coverpoint read_data {
      option.comment = "read data range check";
      bins read_data_range[4] = {[0:$]};
    }

    FULL_FLAG: coverpoint full {
      option.comment = "full flag transition check";
      bins full_transition_0_1 = (0=>1);
      bins full_transition_1_0 = (1=>0);
    }
    EMPTY_FLAG: coverpoint empty {
      option.comment = "empty flag transition check";
      bins empty_transition_0_1 = (0=>1);
      bins empty_transition_1_0 = (1=>0);
    }
    ALMOSTFULL_FLAG: coverpoint almostfull {
      option.comment = "almostfull flag transition check";
      bins almostfull_transition_0_1 = (0=>1);
      bins almostfull_transition_1_0 = (1=>0);
    }
    ALMOSTEMPTY_FLAG: coverpoint almostempty {
      option.comment = "almostempty flag transition check";
      bins almostempty_transition_0_1 = (0=>1);
      bins almostempty_transition_1_0 = (1=>0);
    }
    OVERFLOW_FLAG: coverpoint overflow {
      option.comment = "overflow flag transition check";
      bins overflow_transition_0_1 = (0=>1);
      bins overflow_transition_1_0 = (1=>0);
    }
    UNDERFLOW_FLAG: coverpoint underflow {
      option.comment = "underflow flag transition check";
      bins underflow_transition_0_1 = (0=>1);
      bins underflow_transition_1_0 = (1=>0);
    }
  endgroup

endclass
`endif
