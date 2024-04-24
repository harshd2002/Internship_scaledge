class sub_class;
	byte s1;
endclass

class main_class;
	byte m1;
	sub_class sub_obj = new();
endclass

module subclass_objects();

	main_class m_obj1, m_obj2, m_obj3;
	
	initial begin
	m_obj1 = new();
	m_obj1.m1 = "a";
	m_obj1.sub_obj.s1 = "z";
	$display("-------------------------------------------");
	$display("m_obj1 values are: %p", m_obj1);
	$display("m_obj1 values are: %p", m_obj1.sub_obj);
	$display("m_obj1 address: %0d and m_obj1.sub_obj address: %0d ", m_obj1, m_obj1.sub_obj);
	$display("m_obj2 values are: %p", m_obj2);
	//$display("m_obj1 values are: %p", m_obj2.sub_obj);
	//$display("m_obj2 address: %0d and m_obj2.sub_obj address: %0d ", m_obj2, m_obj2.sub_obj);
	$display("m_obj3 values are: %p", m_obj3);
	//$display("m_obj1 values are: %p", m_obj3.sub_obj);
	//$display("m_obj3 address: %0d and m_obj3.sub_obj address: %0d ", m_obj3, m_obj3.sub_obj);

	m_obj2 = m_obj1;

	$display("-------------------------------------------");
	$display("m_obj1 values are: %p", m_obj1);
	$display("m_obj1 values are: %p", m_obj1.sub_obj);
	$display("m_obj1 address: %0d and m_obj1.sub_obj address: %0d ", m_obj1, m_obj1.sub_obj);
	$display("m_obj2 values are: %p", m_obj2);
	$display("m_obj1 values are: %p", m_obj2.sub_obj);
	$display("m_obj2 address: %0d and m_obj2.sub_obj address: %0d ", m_obj2, m_obj2.sub_obj);
	$display("m_obj3 values are: %p", m_obj3);
	//$display("m_obj1 values are: %p", m_obj3.sub_obj);
	//$display("m_obj3 address: %0d and m_obj3.sub_obj address: %0d ", m_obj3, m_obj3.sub_obj);

	m_obj3 = new m_obj1;

	$display("-------------------------------------------");
	$display("m_obj1 values are: %p", m_obj1);
	$display("m_obj1 values are: %p", m_obj1.sub_obj);
	$display("m_obj1 address: %0d and m_obj1.sub_obj address: %0d ", m_obj1, m_obj1.sub_obj);
	$display("m_obj2 values are: %p", m_obj2);
	$display("m_obj1 values are: %p", m_obj2.sub_obj);
	$display("m_obj2 address: %0d and m_obj2.sub_obj address: %0d ", m_obj2, m_obj2.sub_obj);
	$display("m_obj3 values are: %p", m_obj3);
	$display("m_obj1 values are: %p", m_obj3.sub_obj);
	$display("m_obj3 address: %0d and m_obj3.sub_obj address: %0d ", m_obj3, m_obj3.sub_obj);

	m_obj1.m1 = "A";
	m_obj1.sub_obj.s1 = "Z";

	$display("-------------------------------------------");
	$display("m_obj1 values are: %p", m_obj1);
	$display("m_obj1 values are: %p", m_obj1.sub_obj);
	$display("m_obj1 address: %0d and m_obj1.sub_obj address: %0d ", m_obj1, m_obj1.sub_obj);
	$display("m_obj2 values are: %p", m_obj2);
	$display("m_obj1 values are: %p", m_obj2.sub_obj);
	$display("m_obj2 address: %0d and m_obj2.sub_obj address: %0d ", m_obj2, m_obj2.sub_obj);
	$display("m_obj3 values are: %p", m_obj3);
	$display("m_obj1 values are: %p", m_obj3.sub_obj);
	$display("m_obj3 address: %0d and m_obj3.sub_obj address: %0d ", m_obj3, m_obj3.sub_obj);
	$display("-------------------------------------------");
	end

endmodule
