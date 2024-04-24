//Randomize a 32 bit variable in such a way that number of one's is 12.

parameter ONES = 12;

//class to randomize the variable
class count_ones;
	rand int ones;
	constraint c1 {
		$countones(ones) == ONES;
	}
	function void disp();
		$display("value is: %0b", ones);
	endfunction

endclass

module ones_12_rand();
	count_ones obj1;
	initial begin
		obj1 = new();
		repeat(10) begin
			if(!obj1.randomize())
				$error("Randomization Failed");
			obj1.disp();
		end
	end

endmodule

