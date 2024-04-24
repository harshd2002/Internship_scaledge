//super class for parent class
class grandparent;
	int a;
	function void disp();
		$display("values is: %0d", a);
	endfunction
endclass

//super class for child class
//derived class for grandparent class
class parent extends grandparent;
	int a;
	function void disp();
		super.disp();
		$display("values is: %0d", a);
		$display("values is: %0d", super.a);
	endfunction
	function void store(int a);
		super.a = a;
	endfunction
endclass

//derived class for parent class
class child extends parent;
	int a;
	function void disp();
		super.disp();
		$display("values is: %0d", a);
		$display("values is: %0d", super.a);
	endfunction
	function void store(int a, int b);
		super.store(b);
		super.a = a;
	endfunction
endclass

module protected_example();

	child obj_c1;
	initial begin
	obj_c1 = new();
	obj_c1.a = 12;
	obj_c1.store(11, 10);
	obj_c1.disp();
	end

endmodule
