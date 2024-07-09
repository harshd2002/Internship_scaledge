//sequencer class for asynchronous fifo

`ifndef AFIFO_SEQUENCER
`define AFIFO_SEQUENCER

class fifo_base_seqr extends uvm_sequencer #(fifo_seqs_item);

  `uvm_component_utils(fifo_base_seqr);

  function new (string name = "fifo_base_seqr" , uvm_component parent);
    super.new(name,parent);
  endfunction

endclass

`endif
