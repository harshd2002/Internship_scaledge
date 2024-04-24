module unique_elements();
  
  parameter LENGTH = 20;
  int unique_arr [LENGTH];
  shortint i,j;
	byte k;
	bit flag;
  
  initial begin
    
    foreach(unique_arr[i])
      unique_arr[i] = {$random(k)} % 10;
    
    for(i=0; i<LENGTH; i++) begin
      for(j=0; j<LENGTH; j++) begin
        if((unique_arr[i] == unique_arr[j]) && (i != j)) begin
					flag = 1'b1;
					break;
				end
				else
					flag = 1'b0;
      end
			if(flag == 1'b0)
				$display("%0dth element %0d is unique.", i, unique_arr[i]);
    end
    
  end
  
endmodule
