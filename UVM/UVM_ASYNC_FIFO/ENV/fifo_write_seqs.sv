////////////////////////////////////////////////
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_write_seqs.sv
//File_Path    : 
//Class_Name   : fifo_write_seqs               
//Project_Name : Asynhronous_FIFO
//Description  :
/////////////////////////////////////////////////

`ifndef AFIFO_WRITE_SEQS
`define AFIFO_WRITE_SEQS

class fifo_write_seqs extends fifo_base_seqs;

  //factory registration
  `uvm_object_utils(fifo_write_seqs)

  function new(string name = "fifo_write_seqs");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_itr) begin
      `uvm_do_with(req, {wr_enb == 1; rd_enb == 0;})
    end
  endtask

endclass

`endif

