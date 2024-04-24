class class_constant;
	const int pro1 = 8;
	int pro2;
	function new(int a)
		pro1 = a;
	endfunction
	function void disp();
		$display("properties values are: %0d %0d",pro1, pro2);
	endfunction
endclass

module constant_example();

	const class_constant obj1;
 	class_constant obj2 = new(7);
	initial begin
		obj1 = new(5);
		//obj1.pro1 = 15;
		obj1.pro2 = 30;
		obj1.disp();
		obj1.pro2 = 35;
		obj1.pro2 = 40;
		obj1 = obj2;
	end

endmodule
