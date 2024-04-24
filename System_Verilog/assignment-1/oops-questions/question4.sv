class class_4;
	int data1;
	string data2;

	function void user_i(int data1, string  data2);
		this.data1 = data1;
		this.data2 = data2;
	endfunction

endclass

module pass_value_user();

	class_4 obj1, obj2, obj3;

	initial begin

	obj1 = new();
	obj2 = new();

	obj1.user_i(500, "harsh");
	obj2.user_i(850, "devda");

	$display("obj1: %p", obj1);
	$display("obj2: %p", obj2);

	end

endmodule
