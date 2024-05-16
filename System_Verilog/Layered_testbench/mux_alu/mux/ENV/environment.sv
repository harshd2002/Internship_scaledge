class environment;

  transaction trans_h;
  
  mailbox#(transaction)g2d;
  mailbox#(transaction)m2r;
  mailbox#(transaction)m2s;
  mailbox#(transaction)r2s;
    
  generator generatr;
  driver drivr;
  monitor monitr;
  reference_model refer_mdl;
  scoreboard score_brd;

  virtual inf vif;


  function void build();
    g2d=new();
    m2r=new();
    m2s=new();
    r2s=new();
    drivr=new();
    monitr=new();
    refer_mdl=new();
    score_brd=new();
  endfunction


  function void connect(virtual inf vif);
    this.vif=vif;
    generatr.connect(g2d);
    drivr.connect(vif,g2d);
    monitr.connect(vif,m2r,m2s);
    refer_mdl.connect(m2r,r2s);
    score_brd.connect(m2s,r2s); 
  endfunction



  task run();
    begin
      ->reset_call;
      fork
        generatr.run();
        drivr.run();
        monitr.run();
        refer_mdl.run();
        score_brd.run();
      join_any
    end
  endtask


endclass
