//environment class

class environment;
	//virtual interface to pass ports
	virtual mux_interface vintf;
	//main mailbox declarations
	mailbox #(transaction) gen_drv = new();
	mailbox #(transaction) mon_pred_scrbd = new();
	mailbox #(transaction) pred_scrbd = new();
	//handles of blocks inside environment
	generator gen_h;
	driver drv_h;
	monitor mon_h;
	predictor pred_h;
	scoreboard scrbd_h;

  ////building objects oh each component
	task build();
		//gen_h = new();
		drv_h = new();
		mon_h = new();
		pred_h = new();
		scrbd_h = new();
	endtask
  //connnecting mailbox and interface
	task connect(virtual mux_interface vintf);
		this.vintf = vintf;
		gen_h.connect(gen_drv);
		drv_h.connect(gen_drv, vintf);
		mon_h.connect(mon_pred_scrbd, vintf);
		pred_h.connect(mon_pred_scrbd, pred_scrbd);
		scrbd_h.connect(mon_pred_scrbd, pred_scrbd);
	endtask
	//generating and passing values
	task run();
		fork
			gen_h.run();
			drv_h.run();
			mon_h.run();
			pred_h.run();
			scrbd_h.run();
		join_any
			$display("env run completed");
	endtask
endclass
