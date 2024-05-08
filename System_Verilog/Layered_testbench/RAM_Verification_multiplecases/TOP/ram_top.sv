`ifndef RAM_TOP_SV
`define RAM_TOP_SV

module ram_top;
import ram::*;
	//acutal interface 
	logic clk;
	ram_intf intf(clk);
	//instance of test class 
	ram_base_test test = new();

	ram_rtl dut(.clk(clk),.rstn(intf.rstn),.wr_en(intf.wr_en),
	            .rd_en(intf.rd_en),.wr_addr(intf.wr_addr),
							.rd_addr(intf.rd_addr),.wr_data(intf.wr_data),
							.rd_data(intf.rd_data));
	 initial begin
	//clock generation
	  clk = 0;
	 	forever #5 clk = ~clk;
	 end
	//dut instantiation
	
//run_test
//build 
//connect
//run
	task run_test();
	   //if ($time != 0)
	    // $fatal($sformatf("run_test must be called at 0 simultion time, current simulation time is %t",$time));
		
  	    test.build_env();
		test.connect(intf);
		test.run_phase();
		//wait(objection_count == 0);
		#100;
		$finish;
	endtask
	
	function void raise_objection():
	  objection_count++;
	endfunction
	
	function void drop_objection():
	  objection_count--;
	endfunction

	initial begin
	  intf.reset();
	 // test = new(intf);//acutal interface passed
		run_test();
		
	end

endmodule
`endif
