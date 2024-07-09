////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_seqs_continuous_rd.sv
//File_Path    : 
//Class_Name   : ram_seqs_continuous_rd               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_seqs_continuous_rd extends ram_base_seqs;
  //factory registration
  `uvm_object_utils(ram_seqs_continuous_rd)
  
  function new(string name = "ram_seqs_continuous_rd");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_itr) begin
      //`uvm_create(req)
      req = ram_seqs_item::type_id::create("req");
      req.ram_en = 1;
      req.randomize() with {op_e == READ;rd_addr == ram_base_vseqs::addr_q[0];};
      ram_base_vseqs::addr_q.pop_front();
      start_item(req);
      `uvm_info("SEQS_CONTINUOUS_RD", $sformatf("req = %0p", req), UVM_LOW);
      req.print();
      finish_item(req);
    end
  endtask

endclass


