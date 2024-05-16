class test_1_extnd_sanitycheck extends generator;





  virtual task run();
    repeat(1)begin
      trans_h=new();
      if(!trans_h.randomize() with {selc==SEL_0;  sel==3'd0;})
        $error("Randomization FAILED");
      $display("----------At Generator Class-------");

      trans_h.print_trans();

      super.put_trans_and_wait_ack();
    end
  endtask



endclass
