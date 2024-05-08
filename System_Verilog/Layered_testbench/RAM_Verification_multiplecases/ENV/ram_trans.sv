`ifndef RAM_TRANS_SV
`define RAM_TRANS_SV

/////////////////////////////////////////////////////
// File: ram_trans.sv                              //
//                                                 //
//                                                 //
//                                                 //
/////////////////////////////////////////////////////



typedef enum bit [1:0] {IDLE,WR,RD,SIM_WR} type_e;

class ram_trans;

	//we will list the features required 
	//for the transaction level activity
	//enum type instance for randomizations
	rand type_e trn_e;
	
	//write signals
	bit wr_en;
	rand bit [`ADDR_WIDTH-1:0] wr_addr;
	rand bit [`DATA_WIDTH-1:0] wr_data;

	//Read signals
	bit rd_en;
	rand bit [`ADDR_WIDTH-1:0] rd_addr;
	bit [`DATA_WIDTH-1:0] rd_data;

	//constraint if required
	constraint con_c { rd_addr != wr_addr;};
	
	//display in table form
	task print_info(input string str);
	$display("-*-*-*-*-*-*-*-*-*-*-*--**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
	$display("Calling from %s",str);
	$display("|		NAME	|		DATA		|		TIME		|");
	$display("-*-*-*-*-*-*-*-*-*-*-*--**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
//	$display("|		Rst		  |		%0d 		|		%0t 		|",this.rstn,$time);
	$display("|		WR      	|		%2d 		|		@%2t 		|",this.trn_e,$time);
	$display("|		wr_addr 	|		%2d 		|		@%2t 		|",this.wr_addr,$time);
	$display("|		wr_data 	|		%2d 		|		@%2t 		|",this.wr_data,$time);
	$display("|		rd_addr 	|		%2d 		|		@%2t 		|",this.rd_addr,$time);
	$display("|		rd_data 	|		%2d 		|		@%2t 		|",this.rd_data,$time);
	$display("-*-*-*-*-*-*-*-*-*-*-*--**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
	endtask
endclass	
`endif
