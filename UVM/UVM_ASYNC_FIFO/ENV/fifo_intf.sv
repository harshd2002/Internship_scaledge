////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_intf.sv
//File_Path    : 
//Class_Name   : fifo_intf               
//Project_Name : Asynchronous FIFO verification 
//Description  :
//
/////////////////////////////////////////////////

//interface for Async FIFO

interface fifo_intf(input wr_clk, rd_clk, input rstn);
	logic wr_enb,rd_enb;
	logic [7:0] wr_data, rd_data;
	logic full, empty, almost_full, almost_empty, overflow, underflow;

	clocking wr_drv_cb @(posedge wr_clk);
		default input #1 output #1;
		output wr_enb, wr_data;
		input full, overflow;
	endclocking

	clocking rd_drv_cb @(posedge rd_clk);
		default input #1 output #1;
		output rd_enb;
		input empty, underflow;
	endclocking

	clocking wr_mon_cb @(posedge wr_clk);
		default input #1 output #1;
		input wr_enb, wr_data;
		input empty, almost_empty, underflow, full, almost_full, overflow;
	endclocking

	clocking rd_mon_cb @(posedge rd_clk);
		default input #1 output #1;
		input rd_enb, rd_data;
		input empty, almost_empty, underflow, full, almost_full, overflow;
	endclocking

	modport wr_drv_mp(clocking wr_drv_cb,
									  input wr_clk);
	modport rd_drv_mp(clocking rd_drv_cb,
									  input rd_clk);
	modport wr_mon_mp(clocking wr_mon_cb,
						        input wr_clk);
	modport rd_mon_mp(clocking rd_mon_cb,
									  input rd_clk);

endinterface
