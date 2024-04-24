class class_8;
	int num;
	string str;
endclass

module method_call();

	class_8 obj1, obj2, obj3;

	initial begin

	obj1 = new();

	obj1.num = 104;
	obj1.str = "harsh";
	$display("------------------------------------------");
	$display("values obj1: %p", obj1);
	$display("address obj1: %d", obj1);
	$display("values obj1: %p", obj2);
	$display("address obj1: %d", obj2);
	$display("values obj1: %p", obj3);
	$display("address obj1: %d", obj3);

	obj2 = obj1;
	$display("------------------------------------------");
	$display("values obj1: %p", obj1);
	$display("address obj1: %d", obj1);
	$display("values obj1: %p", obj2);
	$display("address obj1: %d", obj2);
	$display("values obj1: %p", obj3);
	$display("address obj1: %d", obj3);

	obj2.num = 184;
	obj2.str = "devda";

	obj3 = obj2;
	$display("------------------------------------------");
	$display("values obj1: %p", obj1);
	$display("address obj1: %d", obj1);
	$display("values obj1: %p", obj2);
	$display("address obj1: %d", obj2);
	$display("values obj1: %p", obj3);
	$display("address obj1: %d", obj3);

	obj2 = null;
	$display("------------------------------------------");
	$display("values obj1: %p", obj1);
	$display("address obj1: %d", obj1);
	$display("values obj1: %p", obj2);
	$display("address obj1: %d", obj2);
	$display("values obj1: %p", obj3);
	$display("address obj1: %d", obj3);

	$display("------------------------------------------");
	end

endmodule
