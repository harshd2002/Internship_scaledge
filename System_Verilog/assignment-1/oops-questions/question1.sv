class first_class;
	int num1;
	string str;
	bit [3:0] arr;

	function void display();
		$display("object values are: %d , %s ,%b ", num1, str, arr);
	endfunction

endclass

module class_example();

initial begin
//generating handle
	first_class obj1;

//creating object
	obj1 = new();

//initializing properties
	obj1.num1 = 32;
	obj1.str = "harsh";
	obj1.arr = '{1, 0, 1, 1};

	obj1.display();

end

endmodule
