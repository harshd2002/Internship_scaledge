class derived_c;

	int a;
	local int b;
	function void store(int value);
		b = value;
	endfunction
	function void disp();
		$display("values are: %0d, %0d", a, b);
	endfunction

endclass

module local_access();

	derived_c obj1;

	initial begin
	obj1 = new();
	obj1.a = 28;
	//obj1.b = 59; won't be able to access the private property and will show error.
	obj1.store(74);
	obj1.disp();
	end

endmodule
