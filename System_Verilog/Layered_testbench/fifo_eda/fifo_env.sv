////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project:Asynchronous FIFO verification
//File name: fifo_env.sv
//description: environment class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO environment class

`ifndef FIFO_ENVIRONMENT
`define FIFO_ENVIRONMENT

class fifo_env;
	//main mailbox declarations
	mailbox #(fifo_trans) gen_drv = new(1);
	mailbox #(fifo_trans) mon_pred_scrbd = new();
	mailbox #(fifo_trans) pred_scrbd = new();
  mailbox #(fifo_trans) mon_func_cvg = new(1);

	//handles of blocks inside environment
	fifo_gen gen_h;
	fifo_drv drv_h;
	fifo_mon mon_h;
	fifo_pred pred_h;
	fifo_scrbd scrbd_h;
  fifo_functional_cvg func_cvg_h;

	//passing virtual function
	function void build();
		drv_h = new();
		mon_h = new();
		pred_h = new();
		scrbd_h = new();
    func_cvg_h = new();
  endfunction

	//connecting interface and mailbox
	function void connect(virtual fifo_intf vintf);
		gen_h.connect(gen_drv);
		drv_h.connect(gen_drv, vintf);
		mon_h.connect(mon_pred_scrbd, mon_func_cvg, func_cvg_h, vintf);
		pred_h.connect(mon_pred_scrbd, pred_scrbd);
		scrbd_h.connect(mon_pred_scrbd, pred_scrbd);
    func_cvg_h.connect(vintf, mon_func_cvg);
  endfunction

	//generating and passing values
	task run();
		$display($time, " :env run started");
		fork
			gen_h.run();
  		drv_h.run();
  		mon_h.run();
			scrbd_h.run();
      func_cvg_h.run();
    join_any
	endtask
endclass
`endif
