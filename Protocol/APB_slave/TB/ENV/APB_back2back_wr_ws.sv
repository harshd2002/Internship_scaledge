////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB extended generator class for back to back transaction with wait state

`ifndef APB_GENERATOR_BACK2BACK_WR_WS
`define APB_GENERATOR_BACK2BACK_WR_WS

class apb_back2back_wr_ws extends apb_gen;
  
  //virtual run_phase method
  virtual task run;
    repeat(trans_num) begin
      trans_h = new();
      trans_h.randomize() with {ops_e == P_WRITE;};
      trans_h.Pwrite = 1;
      trans_h.transfer = 1;
      gen_drv.put(trans_h);
      trans_h.print_trans("GENERATOR SANITY");
      @(item_done);
      trans_h.ops_e = P_READ;
      trans_h.Pwrite = 0;
      gen_drv.put(trans_h);
      trans_h.print_trans("GENERATOR SANITY");
      @(item_done);
    end
    trans_h.transfer = 0;
    gen_drv.put(trans_h);
  endtask

endclass

`endif


