//Randomize a class variable in 3 different ways without declaring as rand/randc.

class wo_rand;
	bit [4:0] var1, var2, var3;
	function void post_randomize();
		std::randomize(var1);
	endfunction
	function void disp();
		$display("values are: %2d %2d %2d.", var1, var2, var3);
	endfunction
endclass

module q3();
	wo_rand obj1 = new();
	initial begin
		repeat(10) begin
			std::randomize(obj1.var2);
			obj1.randomize();
			obj1.var3 = $random;
			obj1.disp();
		end
	end
endmodule
