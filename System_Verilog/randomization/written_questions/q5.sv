//Randomize a dynamic array such that:
//		1. Array size between 20 and 40
//		2. At odd index's - values should be even and divisible by 8
//		3. At even index's - values should be odd and divisible by 

`ifndef SV_RAND

`define SV_RAND

class rand_5;
	rand byte unsigned arr_d[];
	constraint c1 {
		arr_d.size() >= 20;
		arr_d.size() <= 40;
	}
	constraint c2 {
		foreach(arr_d[i]) {
			if(i%2 == 0) {
				arr_d[i] % 7 == 0;
				arr_d[i] % 2 == 1;
			}
			else {
				arr_d[i] % 8 == 0;
			}
		}
	}

endclass

module q5();
	rand_5 obj1 = new();
	initial begin
		$display("-------------------------------------------");
		repeat(5) begin
			if(!obj1.randomize())
				$display("Randomization Failed");
			$display("randomized array is: %p", obj1);
		end
		$display("-------------------------------------------");
	end

endmodule
`endif
