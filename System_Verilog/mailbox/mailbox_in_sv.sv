module mailbox_example();

 class trans;
   
   randc bit [1:0] a;
   rand bit [3:0] b;
   rand bit types;
   
 endclass  

 class gen;
 
    trans trans_h;
		//bit y;
	
	//mailbox #(trans) mbx1;
	mailbox #(trans) gen_drv;
	
    //function new(mailbox #(trans) mbx2);          
	function new(mailbox #(trans) gen_drv);  
	    this.gen_drv = gen_drv;
		//mbx1 = mbx2;
    endfunction
	
	task run();
	     //trans_h=new();	
         trans_h=new();	   
	   repeat(10) begin
	     assert(trans_h.randomize());
		 gen_drv.put(trans_h);
		 //y = gen_drv.try_put(trans_h);
		//$display($time," : IN GEN : %p",trans_h);
		 //mbx1.put(trans_h);
		 
		 $display($time," : IN GEN mbx : %p",trans_h);
		/* if (y)
		   $display("Success ! Data has been put inside mailbox");
		else
		   $display("Failure ! Data has not been put inside mailbox");
	  */
       //  #10;
	  end
	  //$display("No. of trans = %d",gen_drv.num());
	
	endtask
	
endclass :gen
    
	
class driver;

   trans trans_h;
   
   //mailbox #(trans) mbx3;
   mailbox #(trans) gen_drv;
   
    //function new(mailbox #(trans) mbx4);             
	function new(mailbox #(trans) gen_drv);          
	   this.gen_drv = gen_drv;
		//mbx3=mbx4;
   endfunction

    task run();
       repeat(10) begin
         gen_drv.get(trans_h);
		 //mbx3.get(trans_h);
		 $display($time," : IN DRIVER : %p",trans_h);
       end
	endtask :run
	
endclass

mailbox #(trans) gen_drv=new(5);
//mailbox #(trans) gen_drv=new();

gen gen_h=new(gen_drv);
driver drv_h=new(gen_drv);

initial begin
 fork
   gen_h.run();
   drv_h.run();
 join
  #10 $finish;
end

endmodule  
