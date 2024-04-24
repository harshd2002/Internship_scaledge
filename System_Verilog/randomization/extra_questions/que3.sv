//randomize odd/even values between 10 and 30 using constraints

class odd_even;
	randc bit [4:0] var_even, var_odd;
	constraint c1 {
		var_even >= 10;
		var_even <= 30;
		var_odd >= 10;
		var_odd <= 30;
	}
	constraint c2 {
		var_even % 2 == 0;
		var_odd % 2 == 1;
	}
	function void disp();
		$display("odd: %0d, even: %0d ", var_odd, var_even);
	endfunction
endclass

module que_3();
	odd_even obj1 = new();
	initial begin
		$display("----------------------------------");
		repeat(15) begin
			obj1.randomize();
			obj1.disp();
		end
		$display("----------------------------------");
	end
endmodule
