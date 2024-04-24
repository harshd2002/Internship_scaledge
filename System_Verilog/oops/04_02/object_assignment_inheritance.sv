class parent;
	int p1, p2;
 	function void xyz();
 		$display("Parent Method");
 	endfunction
endclass

class child extends parent;
	int c1, c2;
 	function void xyz();
 		$display("Child Method");
 	endfunction
endclass

module object_ass_inh();
	parent p_h;
	child c_h;
	parent p_h1;
	initial begin
		p_h = new();
		c_h = new();
		c_h.p1 = 25;
		c_h.p2 = 30;
		c_h.c1 = 35;
		c_h.c2 = 40;
		p_h.xyz();
		c_h.xyz();
		$display("parent elements: %p", p_h);
		$display("child elements: %p", c_h);
		$display("parent address: %d", p_h);
		$display("child address: %d", c_h);
		p_h = c_h;
	//c_h = p_h;
		p_h.xyz();
		$display("parent elements: %p", p_h);
		$display("child elements: %p", c_h);
		$display("parent address: %d", p_h);
		$display("child address: %d", c_h);
		p_h.p1 = 5;
		p_h.p2 = 0;
		c_h.p1 = 3;
		c_h.p2 = 4;
		c_h.c1 = 123;
		c_h.c2 = 94;
		p_h.xyz();
		c_h.xyz();
		$display("parent elements: %p", p_h);
		$display("child elements: %p", c_h);
		$display("parent address: %d", p_h);
		$display("child address: %d", c_h);
	end
endmodule
