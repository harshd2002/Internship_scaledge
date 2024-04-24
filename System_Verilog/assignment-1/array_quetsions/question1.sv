module dynamic_queue_example3();
  
  int array_d[];
  int array_q[$];
  
  initial begin
    array_d = new[57];
    array_d[25] = 10;
    array_d[34] = 45;
    array_d[56] = 99;
    
    $display("array elements are: %0p",array_d);
    
  end
  
/*  initial begin
    	array_q.insert(25, 10);
    	array_q.insert(34, 45);
    	array_q.insert(56, 99);
  	end
    
    we cannot store any data at a random location in a queue whether it is bounded or unbounded 
*/  
endmodule
