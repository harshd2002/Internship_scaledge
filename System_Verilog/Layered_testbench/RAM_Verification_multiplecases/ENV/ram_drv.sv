//////////////////////////////////////////////////////////
// 	HEADER Contains: Driver of RAM interface
//	FILE: ram_drv.sv
//	PROJECT: RAM 16x8 Verification 
//
//////////////////////////////////////////////////////////


`ifndef RAM_DRV_SV
`define RAM_DRV_SV

import ram::*;
class ram_drv;

	//transaction class instance;
	ram_trans drv_trns;

	//mailbox for connection between driver and generator
	mailbox #(ram_trans) gen_drv;

	//virtual interface
	virtual ram_intf vintf;
	//or virtual ram_intf.drv_mp vintf

	//connecting to generator mailbox;
//	function new(mailbox #(ram_trans) gen_drv,
	//            virtual ram_intf vintf);
	
		//virtual_interface = actual_interface
		//pointer and object assignment
//			this.vintf = vintf;
//	  	this.gen_drv = gen_drv;
//	endfunction

	function void connect(mailbox #(ram_trans) gen_drv,virtual ram_intf vintf);
		this.vintf = vintf;
		this.gen_drv = gen_drv;
	endfunction
	//Reset Task
	 task reset();
		wait(!vintf.rstn);
		$display("Driver Reset Started");
			vintf.drivercb.wr_en <= 1'b0; 
			vintf.drivercb.wr_addr <= 0;
			vintf.drivercb.wr_data <= 0;
			vintf.rd_en <= 1'b0;
			vintf.rd_addr <= 0; 
		wait(vintf.rstn);
		$display("Driver Reset Ended");
		endtask


 	//run_phase
	task run_phase();
		forever@(vintf.drivercb) begin
  		$display("DRIVER....");
			gen_drv.get(drv_trns);	
			drive_dut();
			drv_trns.print_info("DRIVER");
			-> item_done;
			$display("done getting DRVVVV");
				end
	endtask
	//simulataneous read write supported 

	task drive_dut();

	case(drv_trns.trn_e) 
		WR: begin
		//driving the signals via cb in interface 
		vintf.drivercb.wr_en <= 1'b1; 
		vintf.drivercb.wr_addr <= drv_trns.wr_addr;
		vintf.drivercb.wr_data <= drv_trns.wr_data;
		end

		RD: begin
			vintf.rd_en <= 1'b1;
			vintf.rd_addr <= drv_trns.rd_addr;
		end
		SIM_WR:  begin
			vintf.drivercb.wr_en <= 1'b1; 
			vintf.drivercb.wr_addr <= drv_trns.wr_addr;
			vintf.drivercb.wr_data <= drv_trns.wr_data;
			vintf.rd_en <= 1'b1;
			vintf.rd_addr <=drv_trns.rd_addr; //FIX me //drv_trns.rd_addr;

		end
		default: begin
			vintf.wr_en <= 1'b0;
			vintf.rd_en <= 1'b0;
		end
		endcase
	
	endtask


endclass

//RESET CONCEPT
//->. Generator Driver first time randomize, first time put i.e work on single generator and generator
//static flag between driver and generator
//->. no reset in transaction class
//->. for each testcases take new testscenarios class extends from generator class 
//->. top,driver reset may be may not be
//->. reset idea, 
`endif
