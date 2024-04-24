//Factorial using function

module fact_func();

	integer number;
	integer factorial_out;

	//function to calculate factorial 
	function integer factorial_func(input integer num);
	begin
		if((num == 1'b0) || (num == 1'b1))
			factorial_func = 1'b1;
		else
			factorial_func = factorial_func(num-1) * num;				//recursively calling the function
	end
	endfunction

	//task to diplay 
	task display();
		$display("factorial of %0d is %0d", number, factorial_out);
	endtask

	always @(number) begin
		factorial_out = factorial_func(number);
	end

	initial begin
		
		//finding factorial of 4
		number = 4;
		display();

		//finding factorial of 6
		number = 6;
		display();

	end

endmodule
