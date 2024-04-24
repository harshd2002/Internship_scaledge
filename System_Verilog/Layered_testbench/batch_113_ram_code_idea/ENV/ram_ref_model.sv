
class ram_ref_model;

  //take transation handles
  
  //declare mailbox

  //take new method
  
  
  task run();
   repeat(10) begin
    //collect data from all mailbox
	predict_exp_rd_data(wr_trans_h,rd_trans_h);
	//put transaction for scoboard
   end
  endtask
    
  //description
 task predict_exp_rd_data(ram_trans wr_trans_h, rd_trans_h);
  
 endtask
  
 endclass
	