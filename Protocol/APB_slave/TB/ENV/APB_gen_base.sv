////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB generator class

`ifndef APB_GENERATOR
`define APB_GENERATOR

virtual class apb_gen;
  //transaction class handle
  apb_trans trans_h;

  //mailbox from generator to driver
  mailbox #(apb_trans) gen_drv;

  //connect method
  virtual function void connect(mailbox #(apb_trans) gen_drv);
    this.gen_drv = gen_drv;
  endfunction
  
  //pure virtual run_phase method
  pure virtual task run;

endclass

`endif
