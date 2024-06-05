////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB extended generator class for inbetween reset operation check

`ifndef APB_GENERATOR_INBETWEEN_RESET
`define APB_GENERATOR_INBETWEEN_RESET

class apb_inbetween_reset extends apb_gen;
  
  //virtual run_phase method
  virtual task run;
    fork
    begin
    repeat(trans_num) begin
      trans_h = new();
      trans_h.transfer = 1;
      trans_h.randomize() with {ops_e == P_WRITE; Pwdata <= 32'hFFFFFF;};
      trans_h.Pwrite = 1;
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
    end
    begin
      #INBET_RST;
      -> reset_evt;
    end
    join
  endtask

endclass

`endif


