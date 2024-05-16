////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB environment class

`ifndef APB_ENVIRONMENT
`define APB_ENVIRONMENT

class apb_env;
  //components handle
  apb_gen gen_h;
  apb_drv drv_h;
  apb_mon mon_h;
  apb_pred pred_h;
  apb_scrbd scrbd_h;

  //total mailbox 
  mailbox #(apb_trans) gen_drv;
  mailbox #(apb_trans) mon_scrbd;
  mailbox #(apb_trans) mon_pred;
  mailbox #(apb_trans) pred_scrbd;

  //build method
  task build();
    gen_h   = new();
    drv_h   = new();
    mon_h   = new();
    pred_h  = new();
    scrbd_h = new();
  endtask

  //connect method
  task connect(virtual apb_intf vintf);
    gen_h.connect(gen_drv);
    drv_h.connect(vintf, gen_drv);
    mon_h.connect(vintf, mon_scrbd, mon_pred);
    pred_h.connect(mon_pred, pred_scrbd);
    scrbd_h.connect(mon_scrbd, pred_scrbd);
  endtask

  //run method
  task run();
    fork
      gen_h.run();
      drv_h.run();
      mon_h.run();
      pred_h.run();
      scrbd_h.run();
    join_any
  endtask

endclass

`endif
