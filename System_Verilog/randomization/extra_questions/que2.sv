//generate unique values between 99 and 100;
//since real numbers can be randomized up to a specified limit of decimal places
//here upto 6 decimal place only, unique values can be generated

class unique_real;
	randc bit [9:0] var1;
	real rand_real;
	constraint c1 { var1 != 0; }
	function void post_randomize();
		rand_real = 99 + ( 1 / real'(var1));
		$display("unique value is %0f", rand_real);
	endfunction
endclass

module que_2();
	unique_real obj1 = new();
	initial begin
		$display("----------------------------------");
		repeat(40) begin
			obj1.randomize();
		end
		$display("----------------------------------");
	end
endmodule
