////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: Asynchronous FIFO verification
//File name: fifo_gen.sv
//description: generator class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//Async FIFO generator class

`ifndef FIFO_GENERATOR
`define FIFO_GENERATOR

virtual class fifo_gen;

	//object of transaction class to store data
	fifo_trans trans_h;

	//mailbox to store data 
	mailbox #(fifo_trans) wr_gen_drv;
	mailbox #(fifo_trans) rd_gen_drv;

	//function to connect mailbox
	function void connect(mailbox #(fifo_trans) wr_gen_drv, rd_gen_drv);
		this.wr_gen_drv = wr_gen_drv;
    this.rd_gen_drv = rd_gen_drv;
	endfunction

	//task to generate and store data
	pure virtual task run();

endclass
`endif
