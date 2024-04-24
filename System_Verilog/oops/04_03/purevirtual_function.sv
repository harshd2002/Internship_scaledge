virtual class super_class;
	pure virtual function void store(int arg1, int arg2);
endclass

class child_class extends super_class;
	int ccp1, ccp2;
	function void store(int arg1, int arg2);
		this.ccp1 = arg1;
		this.ccp2 = arg2;
	endfunction
	function  void disp();
		$display("value is: %0d %0d", ccp1, ccp2);
	endfunction
endclass

module purevirtual_func();
	child_class obj1_ch;
	initial begin
		obj1_ch = new();
		obj1_ch.store(10, 35);
		obj1_ch.disp();
	end
endmodule
