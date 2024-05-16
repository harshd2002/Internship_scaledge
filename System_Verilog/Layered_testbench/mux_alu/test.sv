//RAM test class

class test;
  //gen_sanity handle
  gen_sanity sanity_h;
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
    sanity_h = new();
    env_h.gen_h = sanity_h;
    env_h.connect(vintf);
  endtask
  //calling run method
  task run();
		env_h.run();
		$display("test build_run completed");
	endtask
endclass
