class sub_class;
	byte s1;
	function void disp();
		$display("subclass member values: %0d", s1);
	endfunction
endclass

class main_class;
	byte m1;
	sub_class sub_obj;
	function void store_f(sub_class store);
		sub_obj = new();
		sub_obj.s1 = store.s1;
		$display("stored values are: %p", sub_obj);
	endfunction
	function void disp(sub_class print);
		$display("subclass values using mainclass method: %p", print);
	endfunction
endclass

module objects_methods();

	main_class m_obj1, m_obj2;
	sub_class s_obj1, s_obj2;

	initial begin
		s_obj1 = new();
		s_obj1.s1 = "A";

		s_obj2 = new();
		s_obj2.s1 = "B";

		m_obj1 = new();
		m_obj1.m1 = "Z";
		m_obj1.store_f(s_obj1);

		$display("m_obj1 values are: %p", m_obj1);
		m_obj1.disp(m_obj1.sub_obj);

		m_obj2.disp(s_obj2);
	end

endmodule
