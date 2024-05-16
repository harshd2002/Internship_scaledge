////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_env.sv
//description: environment class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM environment class

`ifndef RAM_ENVIRONMENT
`define RAM_ENVIRONMENT

class mem_env;
	//virtual interface to pass ports
	//virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	//main mailbox declarations
	mailbox #(mem_trans) gen_drv = new();
	mailbox #(mem_trans) mon_pred = new();
	mailbox #(mem_trans) mon_scrbd = new();
	mailbox #(mem_trans) pred_scrbd = new();
	//handles of blocks inside environment
	mem_gen gen_h;
	mem_drv drv_h;
	mem_mon mon_h;
	mem_pred pred_h;
	mem_scrbd scrbd_h;

	//passing virtual function
	task build();
		//this.vintf = vintf;
		gen_h = new();
		drv_h = new();
		mon_h = new();
		pred_h = new();
		scrbd_h = new();
	endtask
	//connecting interface and mailbox
	task connect(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		gen_h.connect(gen_drv);
		drv_h.connect(gen_drv, vintf);
		mon_h.connect(mon_pred, mon_scrbd, vintf);
		pred_h.connect(mon_pred, pred_scrbd);
		scrbd_h.connect(mon_scrbd, pred_scrbd);
	endtask
	//generating and passing values
	task run();
		$display("env run started");
		fork
			gen_h.run();
  		drv_h.run();
  		mon_h.run();
			pred_h.run();
			scrbd_h.run();
		join_any
	endtask
endclass
`endif
