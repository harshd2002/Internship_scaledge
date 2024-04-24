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
		super.store(a, b);
		this.a = a;
		this.b = b;
		$display("child1: values are: %0d, %0d", a, b);
	endfunction
endclass

module polymorphism();

	parent obj1_p;
	child1 obj1_c1;

	initial begin

		obj1_p = new();
		obj1_c1 = new();

		obj1_p.store(1, 2);
		obj1_c1.store(3, 4);

		obj1_p = obj1_c1;
		obj1_p.store(260, 259);

	end

endmodule
