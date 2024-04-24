

class ram_gen;

  //comments
  mailbox #(ram_trans) gen2wd_mbx;
  mailbox #(ram_trans) gen2rd_mbx;
  
  //comments
  ram_trans req, req_copy;
  
  //discription
  function new (mailbox #(ram_trans) gen2wd_mbx,
                mailbox #(ram_trans) gen2rd_mbx);
	this.gen2wd_mbx = gen2wd_mbx;
	this.gen2rd_mbx = gen2rd_mbx;
  endfunction
  
  task run();
    repeat(10) begin
	  req = new();
	  if (!req.randomize())
	     $error("RANDOMIZATION FAILED!")
	  req_copy = new req;
	  this.gen2wd_mbx.put(req_copy);
	 :
	 
endclas