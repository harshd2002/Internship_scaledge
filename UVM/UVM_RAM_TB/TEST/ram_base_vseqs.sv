////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_base_vseqs.sv
//File_Path    : 
//Class_Name   : ram_base_vseqs               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_base_vseqs extends uvm_sequence #(uvm_sequence_item);
  //factory registration
  `uvm_object_utils(ram_base_vseqs)
  `uvm_declare_p_sequencer(ram_vseqr)
  //virtual seqeencer
  ram_vseqr vseqr_h;

  static bit [7:0] addr_q[$];

  function new(string name = "ram_base_vseqs");
    super.new(name);
  endfunction

  //task body to connect
	task body();
	  if(!$cast(vseqr_h,m_sequencer))
	    `uvm_fatal(get_name(),"Virtual Sequencer Casting failed!")
  endtask

endclass
