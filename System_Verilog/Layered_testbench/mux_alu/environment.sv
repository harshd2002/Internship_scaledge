//environment class

class environmentt;
	//virtual interface to pass ports
	virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf;
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
	function new(virtual mem_intf #(.DEPTH(256), .DWIDTH(8)) vintf);
		this.vintf = vintf;
	endfunction
	//connection interface and mailbox
	task build();
		gen_obj = new(gen_drv);
		drv_obj = new(gen_drv, vintf);
		mon_obj = new(mon_pred_scrbd, vintf);
		pred_obj = new(mon_pred_scrbd, pred_scrbd);
		scrbd_obj = new(mon_pred_scrbd, pred_scrbd);
	endtask
	//generating and passing values
	task run();
		repeat(2) begin
			@(vintf.mem_cb);
			#2;
		fork
			gen_obj.run();
			begin
			drv_obj.run();
			drv_obj.trans_obj.print_trans();
			end
			begin
			mon_obj.run();
			mon_obj.trans_obj.print_trans();
			end
			begin
				pred_obj.run();
				pred_obj.trans_obj.print_trans();
			end
			begin
				scrbd_obj.run();
				scrbd_obj.exp_trans_obj.print_trans();
				scrbd_obj.act_trans_obj.print_trans();
			end
		join
			$display("env run completed");
		end
	endtask
endclass
