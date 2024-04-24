module queue_queue_example();

  typedef bit [8] array_q1[$];
  array_q1 array_q2[$];

	bit [0:7] array_q3[$][$];
	int ind;
  
  initial begin

		repeat(3) begin
		for(int i=0;i<4;i++) begin
    	array_q2[ind].push_front({$random} % 256);
    	array_q3[ind].push_front({$random} % 256);
		end
		ind++;
		end
    $display("typedef queue: %p.\nmultidimenional declaration queue: %p.", array_q2, array_q3);
    
  end


endmodule
