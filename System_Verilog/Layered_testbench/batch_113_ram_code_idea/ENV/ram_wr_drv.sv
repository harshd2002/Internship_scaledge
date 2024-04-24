
//what is vitual interface

      h1    =    h2;
 //pointer/     object
   handle
   
 //  virtual_interface = actual_interface

class ram_wr_drv;

  //declare mailbox
  
  //virtual interface
  virtual ram_inf.WDR_MP vif;  //its not a actual interface, its just a pointer
  
  //discription
  function new (mailbox ....,
                virtual ram_inf.WDR_MP vif);
	.....
	this.vif = vif;
  endfunction
  
  //discription
  task run();
    //collect transaction from mailbox and drive the interface pins for design 
	// input as per the protocol
	//keep separte task for driving
  endtask
  
  //discription
   task send_to_dut();
   //drive data to design
   //case(trans_h.kind_e)
   //   WRITE, SIM_RW : vif.cb.wr_enb <= 1'b1;
///	  default : vif.cb.wr_enb <= 1'b0;
//	endcase
  //voif.cb.wr_addr <= trans_h.wr_addr;
   
 endtask
 
endclass