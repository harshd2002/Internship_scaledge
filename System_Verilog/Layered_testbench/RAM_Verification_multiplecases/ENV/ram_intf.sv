//////////////////////////////////////////////////////////////
//	FILE: ram_intf.sv
//	
//
//
//////////////////////////////////////////////////////////////


`ifndef RAM_INTF_SV
`define RAM_INTF_SV
interface ram_intf(input logic clk);


	logic rstn;
	//write signals
	logic wr_en;
	logic [(`ADDR_WIDTH-1):0] wr_addr;
	logic [(`DATA_WIDTH-1):0] wr_data;

	//Read signals
	logic rd_en;
	logic [(`ADDR_WIDTH-1):0] rd_addr;
	logic [(`DATA_WIDTH-1):0] rd_data;

	//reset should not be given by clocking block

	//clocking block 
	clocking drivercb @(posedge clk);
	  default input #0 output #1;
	 // output rstn;
		output wr_en,wr_addr,wr_data;
		output rd_en,rd_addr;
		endclocking 


	//clocking block monitor
	clocking moncb @(posedge clk);
	  default input #1 output #0;
	  //input rstn;
	 	input wr_en,wr_addr,wr_data;
		input rd_en,rd_addr;
		input rd_data;
	endclocking 

 task reset();
		@(posedge clk);
		 rstn <= 1'b0;
		repeat (2)@(posedge clk);
			rstn <= 1'b1; 
	endtask

	

endinterface 
`endif
