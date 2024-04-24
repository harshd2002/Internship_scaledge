class class_2;
	bit [0:6] a, b;
endclass 

module delete_objects();

	class_2 obj1, obj2, obj3;
	
	initial begin
	obj1 = new();
	obj1.a = 24;
	obj1.b = 84;
	$display("object has address: %d", obj1);
	$display("object has values: %p", obj1);
	obj2 = new();
	obj2.a = 20;
	obj2.b = 14;
	$display("object has address: %d", obj2);
	$display("object has values: %p", obj2);
	obj3 = new();
	obj3.a = 4;
	obj3.b = 63;
	$display("object has address: %d", obj3);
	$display("object has values: %p", obj3);
	obj1 = null;
	$display("object has address: %d", obj1);
	$display("object has values: %p", obj1);
	end

endmodule
