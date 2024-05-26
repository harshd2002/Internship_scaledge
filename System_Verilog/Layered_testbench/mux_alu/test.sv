//RAM test class

class test;
  //gen_sanity handle
  gen_sanity sanity_h;
  //handle for gen_sel_0 test case
  gen_sel_0 sel_0_h;
  //handle for gen_sel_1 test case
  gen_sel_1 sel_1_h;
  //handle for gen_sel_2 test case
  gen_sel_2 sel_2_h;
  //handle for gen_sel_3 test case
  gen_sel_3 sel_3_h;
  //handle for gen_sel_4 test case
  gen_sel_4 sel_4_h;
  //handle for gen_sel_5 test case
  gen_sel_5 sel_5_h;
  //handle for gen_sel_6 test case
  gen_sel_6 sel_6_h;
  //handle for inbetween reset test case
  gen_inbet_rstn rstn_on_fly;
  //handle for invalid select test case
  gen_invalid_sel invalid_sel;

	//environment handle
	environment env_h;
	//virtual interface to pass interface
	virtual mux_interface vintf;
	//building and running
	task build();
		env_h = new();
		env_h.build();
  endtask

  //calling connect method
  task connect(virtual mux_interface vintf);
		this.vintf = vintf;
    if($test$plusargs("SANITY_CHECK")) begin
      sanity_h = new();
      env_h.gen_h = sanity_h;
    end
    if($test$plusargs("SELECT_0")) begin
      sel_0_h = new();
      env_h.gen_h = sel_0_h;
    end
    if($test$plusargs("SELECT_1")) begin
      sel_1_h = new();
      env_h.gen_h = sel_1_h;
    end
    if($test$plusargs("SELECT_2")) begin
      sel_2_h = new();
      env_h.gen_h = sel_2_h;
    end
    if($test$plusargs("SELECT_3")) begin
      sel_3_h = new();
      env_h.gen_h = sel_3_h;
    end
    if($test$plusargs("SELECT_4")) begin
      sel_4_h = new();
      env_h.gen_h = sel_4_h;
    end
    if($test$plusargs("SELECT_5")) begin
      sel_5_h = new();
      env_h.gen_h = sel_5_h;
    end
    if($test$plusargs("SELECT_6")) begin
      sel_6_h = new();
      env_h.gen_h = sel_6_h;
    end
    if($test$plusargs("RSTN_ON_FLY")) begin
      rstn_on_fly = new();
      RST_DEL = 5;
      env_h.gen_h = rstn_on_fly;
    end
    if($test$plusargs("INVALID_SELECT")) begin
      invalid_sel = new();
      env_h.gen_h = invalid_sel;
    end
    
    env_h.connect(vintf);
  endtask
  //calling run method
  task run();
		env_h.run();
		$display("test build_run completed");
	endtask
endclass
