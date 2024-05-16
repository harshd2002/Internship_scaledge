////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB generator class

`ifndef APB_DRIVER
`define APB_DRIVER

class apb_gen;
  //transaction class handle
  apb_trans trans_h;

  //mailbox from generator to driver
  mailbox #(apb_trans) gen_drv;

  //connect method
  virtual function connect(mailbox #(apb_trans) gen_drv)
    this.gen_drv = gen_drv;
  endfunction
  
  //pure virtual run_phase method
  virtual task run;
    trans_h.randomize();
    gen_drv.put(trans_h);
  endtask

endclass

`endif
