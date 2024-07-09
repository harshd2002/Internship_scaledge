////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_seqs_wr_rd.sv
//File_Path    : 
//Class_Name   : ram_seqs_wr_rd               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_seqs_wr_rd extends ram_base_seqs;
  //factory registration
  `uvm_object_utils(ram_seqs_wr_rd)
  
  function new(string name = "ram_seqs_wr_rd");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_itr) begin
      `uvm_create(req)
      req.ram_en = 1;
      //write packet generation
      req.randomize() with {op_e == WRITE;wr_addr < 16; wr_addr == rd_addr;};
      start_item(req);
      `uvm_info("SEQS_WRITE_READ", $sformatf("req = %0p", req), UVM_LOW);
      req.print();
      finish_item(req);
      //read packet generation
      req.op_e = READ;
      start_item(req);
      `uvm_info("SEQS_WRITE_READ", $sformatf("req = %0p", req), UVM_LOW);
      req.print();
      finish_item(req);
    end
  endtask

endclass
