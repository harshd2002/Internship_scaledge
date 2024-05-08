`ifndef RAM_REFM_SV
`define RAM_REFM_SV
class ram_refm;
	
 //instance of transaction class
	ram_trans act_trns,exp_trns;
	//mailbox to scoreboard
	//mailbox #(ram_trans) ref_src;

	//mailbox to reference model
	mailbox #(ram_trans) mon_ref;


  logic	 [(`DATA_WIDTH-1):0] ref_mem [0:`DEPTH-1];
	function void connect(	mailbox #(ram_trans) mon_ref);
	this.mon_ref = mon_ref;
	endfunction

//	function void connect(	mailbox #(ram_trans) mon_ref);
	//this.mon_ref = mon_ref;
	//endfunction


	task run_phase();
		exp_trns = new();
		forever begin
		mon_ref.get(act_trns);
		act_trns.print_info("Reference Model");
		refer_model(act_trns,exp_trns);
		score(exp_trns);
	//	ref_src.put(exp_trns);
		end
	endtask

	task refer_model(ram_trans act_trns,ram_trans exp_trns);//passing the transaction here
		//if(act_trns.rstn == 0) begin
			 
			 //exp_trns.rd_data = 0;

   		// foreach(ref_mem[i])
     	//	 ref_mem[i] = 0;
		//end
		    if(act_trns.trn_e == WR || act_trns.trn_e == SIM_WR) begin
					ref_mem [act_trns.wr_addr] = act_trns.wr_data;
				end
			  if(act_trns.trn_e == RD || act_trns.trn_e == SIM_WR) begin
					exp_trns.rd_data = ref_mem[act_trns.rd_addr]; 
				end


	endtask

	task score(ram_trans exp_trns);//was also working fine when arguments where not passed 
		fork 
		begin
			wait(exp_trns.rd_data == act_trns.rd_data);
			$display("DATA MATCHED PASSED %0d %0d",exp_trns.rd_data, act_trns.rd_data);
		end
		begin
			#20;
			//driving of input 1 cycle, next 2 cycles tak mera output should be avaiable if not then dut not working
			$display("Timeout");
		end
		begin 
			wait(exp_trns.rd_data != act_trns.rd_data);
		  //exp_trns.print_info();
			$display("DATA NOT MATCHED FAILED %0d %0d",exp_trns.rd_data, act_trns.rd_data);
		end
		join_any
		disable fork;
		endtask
//if want to pass whole class to score board use 
endclass
`endif
