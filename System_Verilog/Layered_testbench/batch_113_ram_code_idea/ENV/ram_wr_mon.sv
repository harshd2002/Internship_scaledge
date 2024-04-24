
class ram_wr_mon;

   //take transation handles
   
  //declare mailbox
  
  //declare virtual interface
  
  //take new method
  
  //discription
  task run();
    //sample/monitor the data from interface as per protocol and put it in
	//the mailbox to further use by other component
	//keep separte task for monitoring
  endtask
  
  //discription
  task monitor();
   //sample data from design
   //create trans_h
   //trans_h.wr_addr = vif.wmon_cb.wr_addr;
   //trans_h.kind_e = kind'{vif.wmon_cb.wr_enb,vif.wmon_cb.rd_enb};
   //$cast(trans_h.kind_e,{vif.wmon_cb.wr_enb,vif.wmon_cb.rd_enb});
  endtask
 
endclass