//virtual sequencer

class ram_vseqr extends uvm_sequencer #(uvm_sequence_item);
	
	`uvm_component_utils(ram_vseqr)

	ram_base_seqr base_seqr_h;
	
	function new(string name = "ram_vseqr",uvm_component parent=null);
		super.new(name,parent);
	endfunction

endclass 
