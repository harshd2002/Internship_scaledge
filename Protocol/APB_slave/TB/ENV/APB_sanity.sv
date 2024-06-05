////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB extended generator class for sanity check

`ifndef APB_GENERATOR_SANITY
`define APB_GENERATOR_SANITY

class apb_sanity extends apb_gen;
  
  //virtual run_phase method
  virtual task run;
    trans_h = new();
    trans_h.randomize() with {ops_e == P_WRITE; Paddr == 31; Pwdata == 32'hFFFFFFFF;};
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
    trans_h.transfer = 0;
    gen_drv.put(trans_h);
  endtask

endclass

`endif

