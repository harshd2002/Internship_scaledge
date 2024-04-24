//RAM environment class

class mem_env;
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
	mailbox #(mem_trans) gen_drv = new();
	mailbox #(mem_trans) mon_pred_scrbd = new();
	mailbox #(mem_trans) pred_scrbd = new();
	mem_gen gen_obj;
	mem_drv drv_obj;
	mem_mon mon_obj;
	mem_pred pred_obj;
	mem_scrbd scrbd_obj;
	function new(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.vintf = vintf;
	endfunction
	task build();
		gen_obj = new(gen_drv);
		drv_obj = new(gen_drv, vintf);
		mon_obj = new(mon_pred_scrbd, vintf);
		pred_obj = new(mon_pred_scrbd, pred_scrbd);
		scrbd_obj = new(mon_pred_scrbd, pred_scrbd);
	endtask
	task run();
		fork
			gen_obj.run();
			begin
			drv_obj.run();
			drv_obj.print_drv();
			end
			begin
			mon_obj.run();
			mon_obj.print_mon();
			end
			begin
				pred_obj.run();
				pred_obj.print_pred();
			end
			begin
				scrbd_obj.run();
				scrbd_obj.print_scrbd();
			end
		join
			$display("env run completed");
	endtask
endclass
