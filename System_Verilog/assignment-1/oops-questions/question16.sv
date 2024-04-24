class parameterised_class #(int SIZE = 8);
	bit [SIZE-1 : 0] p1;
	function void store(bit [SIZE-1:0] p1);
		this.p1 = p1;
		$display("parent: values are: %0d %0d", p1, $bits(p1));
	endfunction
	function void disp();
		$display("parent: values are: %0d", p1);
	endfunction
endclass

module parameterized_class();

	parameterised_class #(8) obj1, obj2;
	parameterised_class #(10) obj3;
	parameterised_class #(16) obj4;

	initial begin

		obj1 = new();
		obj2 = new();
		obj3 = new();
		obj4 = new();

		obj1.store(255);
		obj2.store(125);
		obj3.store(1023);
		obj4.store(65535);

		obj1.store(257);
		obj2.store(125);
		obj3.store(1024);
		obj4.store(65538);

	end

endmodule
