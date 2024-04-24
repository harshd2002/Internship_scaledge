module add_gt_30();
  
  parameter LENGTH = 200;
  int ran_array [LENGTH];
  shortint i;
	integer sum_gt_30 = 0;
	byte k;
  
  initial begin
    
    foreach(ran_array[i])
      ran_array[i] = {$random(k)} % 50;
    
    foreach(ran_array[i])
			$display("element %0d is: %0d", i, ran_array[i]);
    
    for(i=0; i<LENGTH; i++) begin

			if(ran_array[i] > 30)
				sum_gt_30 += ran_array[i];

    end

		$display("addition of elements greater than 30 is: %0d", sum_gt_30);
    
  end
  
endmodule
