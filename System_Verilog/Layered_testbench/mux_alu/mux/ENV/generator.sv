`ifndef MUX_GEN_SV
`define MUX_GEN_SV
virtual class generator;
  
  protected transaction trans_h;
  
  local mailbox #(transaction) g2d;

  selc_line selc;
  
  virtual function void connect(mailbox#(transaction)g2d);
    this.g2d=g2d;
  endfunction

  pure virtual task run();

  protected task put_trans_and_wait_ack();
    g2d.put(trans_h);
    @(item_done);
  endtask

endclass
`endif
