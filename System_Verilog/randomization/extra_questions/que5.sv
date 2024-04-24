// Randomize such that values does not repeat until 5 randomizations

class repeat_rand #(parameter REPEAT = 5, type T = bit [2:0]);
	rand T var1;
	T store[REPEAT];
	constraint c1 {
		!(var1 inside {store});
	}
	function new();
		if((2**($size(T))) < REPEAT)
			$fatal("impossible to implement");
	endfunction
	function void pre_randomize();
		$display("previous values: %p", store);
	endfunction
	function void post_randomize();
		store[0] = var1;
		store = {store[1:REPEAT-1],store[0]};
	endfunction
	function void disp();
		$display("values is: %0d", var1);
	endfunction
endclass

module que_5();
	repeat_rand #(5) obj1 = new();
	initial begin
		$display("----------------------------------");
		repeat(15) begin
			if(!obj1.randomize())
				$warning("Randomization Failed");
			obj1.disp();
		$display("----------------------------------");
		end
	end
endmodule
