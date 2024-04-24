module task_call;
	
	task call();
	begin
		$display($time,"you are in the task");
		#5;
		$display($time,"you are in the task");
	end
	endtask

	initial begin
		#1;
		call();
	end

	initial begin
		call();
	end

endmodule
