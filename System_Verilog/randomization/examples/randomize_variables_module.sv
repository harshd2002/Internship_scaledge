//we cannot randomize variables of a module
//randomization cannot work in module 
module randomization();

	rand int a;
	rand bit [2:0] b;

	initial begin
		a.randomize();
		$display("values of a: %0d", a);
		b.randomize();
		$display("values of a: %0d", b);
	end

endmodule
