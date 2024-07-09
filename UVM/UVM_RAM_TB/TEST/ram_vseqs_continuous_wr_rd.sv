////////////////////////////////////////////////
//
////task body to connect
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_vseqs_continuous_wr_rd.sv
//File_Path    : 
//Class_Name   : ram_vseqs_continuous_wr_rd               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_vseqs_continuous_wr_rd extends ram_base_vseqs;
  //factory registration
  `uvm_object_utils(ram_vseqs_continuous_wr_rd)

  ram_seqs_continuous_wr write_seqs_h;
  ram_seqs_continuous_rd read_seqs_h;

  function new(string name = "ram_vseqs_continuous_wr_rd");
    super.new(name);
  endfunction

  task body();
    //super.body();
    repeat(2) begin
    //`uvm_do_on_with(write_seqs_h,m_sequencer, {no_of_itr == 5;})
    //`uvm_do_on_with(read_seqs_h,m_sequencer, {no_of_itr == 5;})
    `uvm_do_on_with(write_seqs_h,p_sequencer.base_seqr_h, {no_of_itr == 5;})
    `uvm_do_on_with(read_seqs_h,p_sequencer.base_seqr_h, {no_of_itr == 5;})
    end
  endtask

endclass
