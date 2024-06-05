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
    forever  begin
      fork
      begin: RESET_BLOCK
        @(negedge vintf.Presetn);
        $info($time," :reset found");
      end
      begin: DRIVER_BLOCK
        if(`DRV_PATH.Psel !== 1)
          @(`DRV_PATH);

          gen_drv.get(trans_h);
          trans_h.print_trans("driver");

          if(trans_h.transfer)
            `DRV_PATH.Psel <= 1;
          else
            `DRV_PATH.Psel <= 0;
            `DRV_PATH.Penable <= 0;
            `DRV_PATH.Paddr   <= trans_h.Paddr;
            `DRV_PATH.Pwrite  <= trans_h.Pwrite;
            `DRV_PATH.Pwdata  <= trans_h.Pwdata;

        @(`DRV_PATH)
        if(vintf.Psel == 1) begin
          `DRV_PATH.Penable <= 1;
        
        wait(`DRV_PATH.Pready);
        end
        -> item_done;

      end: DRIVER_BLOCK
      join_any
      disable fork;
      if(!vintf.Presetn) begin
        $info($time, " :RESET asserted");
        vintf.Psel    <= 0;
        vintf.Penable <= 0;
        vintf.Pwdata  <= 0;
        vintf.Paddr   <= 0;
        vintf.Pwrite  <= 0;
        @(posedge vintf.Presetn);
        $info($time, " :RESET de-asserted");
      end
    end
  endtask

endclass

`endif
