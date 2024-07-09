//sequencer class for ram

class ram_base_seqr extends uvm_sequencer #(ram_seqs_item);

  `uvm_component_utils(ram_base_seqr);

  function new (string name = "ram_base_seqr" , uvm_component parent);
    super.new(name,parent);
  endfunction

endclass
