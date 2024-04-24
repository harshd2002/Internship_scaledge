module maximum();
  
  parameter LENGTH = 200;
  int max, ran_array [LENGTH];
  shortint i;
	byte k;
  
  initial begin
    foreach(ran_array[i])
      ran_array[i] = {$random(k)} % 50;
    
    foreach(ran_array[i])
			$display("element %0d is: %0d", i, ran_array[i]);
    max = ran_array[0];
    for(i=1; i<LENGTH; i++) begin
			if(max < ran_array[i])
				max = ran_array[i];
    end

		$display("maximum element value is: %0d", max);
    
  end
endmodule
