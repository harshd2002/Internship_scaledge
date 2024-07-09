////////////////////////////////////////////////
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_read_seqs.sv
//File_Path    : 
//Class_Name   : fifo_read_seqs               
//Project_Name : Asynhronous_FIFO
//Description  :
/////////////////////////////////////////////////

`ifndef AFIFO_READ_SEQS
`define AFIFO_READ_SEQS

class fifo_read_seqs extends fifo_base_seqs;

  //factory registration
  `uvm_object_utils(fifo_read_seqs)

  function new(string name = "fifo_read_seqs");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_itr) begin
      `uvm_do_with(req, {wr_enb == 0; rd_enb == 1;})
    end
  endtask

endclass

`endif


