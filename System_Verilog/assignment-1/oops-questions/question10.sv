class parent;
	int a;
	function void xyz(int value);
		a = value;
		$display("parent: values are: %0d", a);
	endfunction
endclass

class A extends parent;
	int b;
endclass

class B extends parent;
	byte b;
	task write(int a, byte b);
		super.a = a;
		this.b = b;
		$display("child2: values are: %0d, %0d", a, b);
	endfunction
endclass

class C extends parent;
	function void read();
		$display("child2: values are: %0d", a);
	endfunction
endclass

module inheritance();

	parent obj1_p;
	A obj1_a;
	B obj1_b;
	C obj1_c;

	initial begin

		obj1_p = new();
		obj1_a = new();
		obj1_b = new();
		obj1_c = new();

		obj1_p.xyz(1);
		obj1_a.xyz(3);
		obj1_b.xyz(5);
		obj1_b.write(5);
		obj1_c.xyz(7);
		obj1_c.read(7);

	end

endmodule
