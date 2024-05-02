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
	mailbox #(mem_trans) mon_pred_scrbd = new();
	mailbox #(mem_trans) pred_scrbd = new();
	//handles of blocks inside environment
	mem_gen gen_obj;
	mem_drv drv_obj;
	mem_mon mon_obj;
	mem_pred pred_obj;
	mem_scrbd scrbd_obj;

	//passing virtual function
	task build();
		//this.vintf = vintf;
		//gen_obj = new();
		drv_obj = new();
		mon_obj = new();
		pred_obj = new();
		scrbd_obj = new();
	endtask
	//connecting interface and mailbox
	task connect(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		gen_obj.connect(gen_drv);
		drv_obj.connect(gen_drv, vintf);
		mon_obj.connect(mon_pred_scrbd, vintf);
		pred_obj.connect(mon_pred_scrbd, pred_scrbd);
		scrbd_obj.connect(mon_pred_scrbd, pred_scrbd);
	endtask
	//generating and passing values
	task run();
		$display("env run started");
		fork
			gen_obj.run();
  		drv_obj.run();
  		mon_obj.run();
			pred_obj.run();
			scrbd_obj.run();
		join
	endtask
endclass
`endif
