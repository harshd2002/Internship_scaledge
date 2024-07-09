////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_drv_cb.sv
//File_Path    : 
//Class_Name   : ram_drv_cb               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

class ram_drv_cb extends uvm_callback;
  
  function new(string name = "ram_drv_cb");
    super.new(name);
  endfunction

  virtual function void no_chip_select(ref ram_seqs_item seqs_item);
    seqs_item.ram_en = 0;
  endfunction

endclass
