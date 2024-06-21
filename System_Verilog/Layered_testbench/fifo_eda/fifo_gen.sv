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
	mailbox #(fifo_trans) gen_drv;
	//mailbox #(fifo_trans) rd_gen_drv;

	//function to connect mailbox
	function void connect(mailbox #(fifo_trans) gen_drv/*wr_gen_drv, rd_gen_drv*/);
		this.gen_drv = gen_drv;
    //this.rd_gen_drv = rd_gen_drv;
	endfunction

	//task to generate and store data
	pure virtual task run();

  virtual task write_op();
    $display($time," : write operation generator");
		trans_h = new();
    trans_h.wr_data.rand_mode(1);
		trans_h.randomize() with {ops_e == WRITE;};
		$display($time," : generated values: %0p", trans_h);
  endtask

  virtual task read_op();
    $display($time," : read operation generator");
		trans_h = new();
    trans_h.wr_data.rand_mode(0);
		trans_h.randomize() with {ops_e == READ;};
		$display($time," : generated values: %0p", trans_h);
  endtask
/*
  virtual task simultaneous_wr_rd_op();
    $display($time," : simultaneous read-write operation generator");
		trans_h = new();
		trans_h.randomize() with {ops_e == WRITE_READ;};
		$display($time," : generated values: %0p", trans_h);
 endtask
*/
endclass
`endif
