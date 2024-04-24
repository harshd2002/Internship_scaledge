//not going to run in vcs

class class_5;
	function void print();
		$display("--------------------");
		$display("hello_world");
		$display("--------------------");
	endfunction
endclass

module method_call();

	class_5 obj1, obj2, obj3;

	initial begin

	obj1 = new();

	obj1.print();
	obj2.print();

	end

endmodule
