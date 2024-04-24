//super class for child class
class parent; 
	int a;
	function void disp();
		$display("values is: %0d", a);
	endfunction
endclass

//derived class for parent class
class child extends parent;
	int a;
	function void disp();
		super.disp();
		$display("values is: %0d", a);
	endfunction
	function void store(int a, int b);
		super.a = a;
		this.a = b;
	endfunction
endclass

module example12();

	child obj_c1;
	initial begin
	obj_c1 = new();
	obj_c1.a = 12;
	obj_c1.store(11, 10);
	obj_c1.disp();
	end

endmodule
