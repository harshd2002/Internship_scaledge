////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_scrbd.sv
//File_Path    : 
//Class_Name   : ram_scrbd               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

//scoreboard class 

class ram_scrbd extends uvm_scoreboard;

  `uvm_component_utils(ram_scrbd)

  //associatie array for scoreboarding
  byte unsigned exp_arr_a[byte], act_arr_a[byte];
  bit [7:0] index;

  //implementation port
  uvm_analysis_imp #(ram_seqs_item, ram_scrbd) scrbd_analysis_imp;

  function new(string name="agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scrbd_analysis_imp = new("scrbd_analysis_imp", this);
  endfunction

  function void write(ram_seqs_item trans_item);
    if(trans_item.op_e == WRITE)
      exp_arr_a[trans_item.wr_addr] = trans_item.wdata;
    if(trans_item.op_e == READ)
      act_arr_a[trans_item.rd_addr] = trans_item.rdata;
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    $display("scoreboard run_phase stareted");
    forever begin
      $display("before wait");
      wait((exp_arr_a.num()!==0) && (act_arr_a.num()!==0));
        `uvm_info("SCOREBOARD", $sformatf(" at addr: %0d , data: %0p",index, exp_arr_a[index]),UVM_LOW)
        `uvm_info("SCOREBOARD", $sformatf(" at addr: %0d , data: %0p",index, act_arr_a[index]),UVM_LOW)
      $display("after wait");
      act_arr_a.first(index);
      $display("index: %0d", index);
      if(exp_arr_a[index] == act_arr_a[index])
        `uvm_info("SCOREBOARD", $sformatf("PASS: read at addr: %0d , data: %0d",index, act_arr_a[index]),UVM_LOW)
      else
        `uvm_info("SCOREBOARD", $sformatf("FAIL: read at addr: %0d , data: %0d",index, act_arr_a[index]),UVM_LOW)
      exp_arr_a.delete(index);
      act_arr_a.delete(index);
    end
  endtask

endclass
