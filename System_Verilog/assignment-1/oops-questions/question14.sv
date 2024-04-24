class parent;
	int a, b;
	virtual function void store(int a, int b);
		this.a = a;
		this.b = b;
		$display("parent: values are: %0d, %0d", a, b);
	endfunction
endclass

class child1 extends parent;
	int a, b;
	function void store(int a, int b);
		this.a = a;
		this.b = b;
		$display("child1: values are: %0d, %0d", a, b);
	endfunction
endclass

class child2 extends parent;
	int a, b;
	function void store(int a, int b);
		this.a = a;
		this.b = b;
		$display("child2: values are: %0d, %0d", a, b);
	endfunction
endclass

class child3 extends parent;
	int a, b;
	function void store(int a, int b);
		this.a = a;
		this.b = b;
		$display("child2: values are: %0d, %0d", a, b);
	endfunction
endclass

module polymorphism();

	parent obj1_p;
	child1 obj1_c1;
	child2 obj1_c2;
	child3 obj1_c3;

	initial begin

		obj1_p = new();
		obj1_c1 = new();
		obj1_c2 = new();
		obj1_c3 = new();

		obj1_p.store(1, 2);
		obj1_c1.store(3, 4);
		obj1_c2.store(5, 6);
		obj1_c3.store(7, 8);

		obj1_p = obj1_c1;
		obj1_p.store(260, 259);

		obj1_p = obj1_c2;
		obj1_p.store(258, 257);

		obj1_p = obj1_c3;
		obj1_p.store(256, 255);

	end

endmodule
