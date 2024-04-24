//Disable randomize of all the variables in the class

class rand_10;
	rand bit [3:0] var1;
	rand byte var2;
	rand logic [3:0] var3;
	function void disp();
		$display("randomized values are: %0d %0d %0d", var1, var2, var3);
	endfunction
endclass

module q10();
	rand_10 obj1 = new();
	initial begin
		obj1.disp();
	repeat(5) begin
		if(!obj1.randomize())
			$display("Randomization Failed");
		obj1.disp();
	end
	obj1.var1.rand_mode(0);
	obj1.var2.rand_mode(0);
	obj1.var3.rand_mode(0);
	repeat(5) begin
		if(!obj1.randomize())
			$display("Randomization Failed");
		obj1.disp();
	end
	obj1.rand_mode(1);
	repeat(5) begin
		if(!obj1.randomize())
			$display("Randomization Failed");
		obj1.disp();
	end
	end
endmodule
