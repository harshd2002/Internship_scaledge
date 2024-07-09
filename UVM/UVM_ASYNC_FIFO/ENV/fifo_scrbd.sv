////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_scrbd.sv
//File_Path    : 
//Class_Name   : fifo_scrbd               
//Project_Name : Asynhronous_FIFO
//Description  :
//
/////////////////////////////////////////////////

//scoreboard class 

class fifo_scrbd extends uvm_scoreboard;

  `uvm_component_utils(fifo_scrbd)

  //associatie array for scoreboarding
  fifo_seqs_item exp_arr_a[$], act_arr_a[$];

  //implementation port
  uvm_analysis_imp #(fifo_seqs_item, fifo_scrbd) scrbd_analysis_imp;

  function new(string name="agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scrbd_analysis_imp = new("scrbd_analysis_imp", this);
  endfunction

  function void write(fifo_seqs_item trans_item);
    if(trans_item.wr_enb)
      exp_arr_a.push_back(trans_item);
    if(trans_item.rd_enb)
      act_arr_a.push_back(trans_item);
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("scoreboard run_phase started"), UVM_MEDIUM)
    forever begin
      wait((exp_arr_a.size()!==0) && (act_arr_a.size()!==0));
      `uvm_info("SCOREBOARD", $sformatf(" expected data: %0p", exp_arr_a[0]), UVM_LOW)
      //if(act_arr_a.size()) begin
        `uvm_info("SCOREBOARD", $sformatf(" actual data: %0p", act_arr_a[0]), UVM_LOW)
        if(exp_arr_a[0].wr_data == act_arr_a[0].rd_data)
          `uvm_info("SCOREBOARD", $sformatf("PASS: read data: %0d , write data: %0d",exp_arr_a[0].wr_data, act_arr_a[0].rd_data),UVM_LOW)
        else
          `uvm_error("SCOREBOARD", $sformatf("FAIL: read data: %0d , write data: %0d",exp_arr_a[0].wr_data, act_arr_a[0].rd_data))
      //end
    if(((exp_arr_a[$].full) && (exp_arr_a.size()==16)) || ((!exp_arr_a[$].full) && (exp_arr_a.size()!=16)))
		  `uvm_info(get_type_name(), $sformatf(" full flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" full flag fail "))
    if(((exp_arr_a[$].empty) && (exp_arr_a.size()==0)) || ((!exp_arr_a[$].empty) && (exp_arr_a.size()!=0)))
		  `uvm_info(get_type_name(), $sformatf(" empty flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" empty flag fail "))
    if(((exp_arr_a[$].almost_full) && (exp_arr_a.size()>=14 && exp_arr_a.size()<16)) || ((!exp_arr_a[$].almost_full) && (exp_arr_a.size()<14 || exp_arr_a.size()==16)))
		  `uvm_info(get_type_name(), $sformatf(" almost full flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" almost full flag fail "))
    if(((exp_arr_a[$].almost_empty) && (exp_arr_a.size()>=1 && exp_arr_a.size()<3)) || ((!exp_arr_a[$].almost_empty) && (exp_arr_a.size()==0 || exp_arr_a.size()>2)))
		  `uvm_info(get_type_name(), $sformatf(" almost empty flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" almost empty flag fail "))
    if(((exp_arr_a[$].overflow) && (exp_arr_a[$].full) && (exp_arr_a[$].wr_enb)) || ((!exp_arr_a[$].overflow) && (!exp_arr_a[$].full) || (exp_arr_a[$].rd_enb)))
		  `uvm_info(get_type_name(), $sformatf(" overflow flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" overflow flag fail "))
    if(((exp_arr_a[$].underflow) && (exp_arr_a[$].empty) && (exp_arr_a[$].ops_e==READ)) || ((!exp_arr_a[$].underflow) && (!exp_arr_a[$].empty) || (exp_arr_a[$].ops_e!=READ)))		  
		  `uvm_info(get_type_name(), $sformatf(" underflow flag pass "), UVM_LOW)
    else
		  `uvm_error(get_type_name(), $sformatf(" underflow flag fail "))

      exp_arr_a.pop_back();
      act_arr_a.pop_back();
    end
  endtask

endclass
