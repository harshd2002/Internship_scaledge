class super_c;
	int a, b;
	function new(int a, int b);
		this.a = a;
		this.b = b;
		$display("superclass new");
	endfunction
endclass

class derived_c extends super_c(0, 0);
	int c, d;
/*	function new(int c, int d);
	super.new(0,0);
		this.c = c;
		this.d = d;
	endfunction*/
endclass

module new_inheritance();

	derived_c obj_d1;
	super_c obj_s1;

	initial begin
		obj_s1 = new(2, 4);
		$display("super: %p", obj_s1);
		obj_d1 = new(1, 1);
		$display("devired: %p", obj_d1);

	end

endmodule
