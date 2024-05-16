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
	fifo_trans trans_obj;

	//mailbox to store data 
	mailbox #(fifo_trans) gen_drv;

	//function to connect mailbox
	function connect(mailbox #(fifo_trans) gen_drv);
		this.gen_drv = gen_drv;
	endfunction

	//task to generate and store data
	pure virtual task run();

endclass
`endif
