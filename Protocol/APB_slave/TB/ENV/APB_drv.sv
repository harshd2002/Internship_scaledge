////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB driver class

`ifndef APB_DRIVER
`define APB_DRIVER

class apb_drv;
  //transaction class handle
  apb_trans trans_h;

  //mailbox to get data from generator
  mailbox #(apb_trans) gen_drv;

  //virtual interface
  virtual apb_intf vintf;

  //connecting virtual interface and mailbox
  function void connect(virtual apb_intf vintf,mailbox #(apb_trans) gen_drv);
    this.vintf = vintf;
    this.gen_drv = gen_drv;
  endfunction

  //run method
  task run;
    forever @(`DRV_PATH) begin
      gen_drv.get(trans_h);
      `DRV_PATH.Paddr <= trans_h.Paddr;
      `DRV_PATH.Pwdata <= trans_h.Pwdata;
    end
  endtask

endclass

`endif
