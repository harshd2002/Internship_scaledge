class class_1;
	rand bit [2:0] var1;
	constraint c1 {
		var1 >= 0;
		var1 <= 200;
	}
	mailbox #(single_class) mbox1 = new();
	
	function void disp_prop();
		$display("values are : %0d ", var1);
	endfunction
	function void disp_mbx(single_class obj1);
		$display("values are : %0p", mbox1.get(obj1));
	endfunction
endclass

class class_2;
	rand byte var1;
	constraint c1 {
		var1 >= 0;
		var1 <= 150;
	}
	mailbox #(single_class) mbox1 = new();
	
	function void disp_prop();
		$display("values are : %0d ", var1);
	endfunction
	function void disp_mbx(single_class obj1);
		$display("values are : %0p", mbox1.get(obj1));
	endfunction
endclass

module mail_methods();
	class_1 obj1 = new();
	class_2 obj2 = new();
	initial begin
		obj1.randomize();
		obj1.mbox1.put(obj1);
		obj1.disp_prop();
		obj1.disp_mbx(obj1);
		obj1.mbox1.get(obj1);
	end
endmodule
