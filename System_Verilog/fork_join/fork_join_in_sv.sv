module fork_join_in_sv();

   initial begin
     $display($time," : at 0ns Before fork join");
	 #10 $display($time," : at 10ns Before fork join");
	 fork:F1
	   #10 $display($time," : at 0ns in fork join : before begin");
	   #20 $display($time," : at 20ns in fork join : before begin");
	   begin:B1
	    #30 $display($time," : at 30ns in fork join : in begin");
		#40 $display($time," : at 40ns in fork join : in begin");
	   end
	   #10 $display($time," : at 10ns in fork join : after begin");
	   #90 $display($time," : at 90ns in fork join : after begin");
	 //join
	 //join_any
	 join_none
	  #10 $display($time," : at after fork join");
	//wait fork;
	#30 $display($time," : at 30ns after fork join");
	 //disable F1.B1;
	//disable fork;
	
	  #80 $display($time," : at 80ns after fork join");
 	
	end
	 
endmodule
	 
