class test;

  environment env=new();

  virtual inf vif;

  test_1_extnd_sanitycheck test1;

  virtual function void build();
    env.build();
  endfunction 



  virtual function void connect(virtual inf vif);
    
    if($test$plusargs("SANITY_CHECK"))begin
      test1=new();  
      env.generatr=test1;
    end

    env.connect(vif);
  endfunction

  task run();
    env.run();
  endtask


endclass
