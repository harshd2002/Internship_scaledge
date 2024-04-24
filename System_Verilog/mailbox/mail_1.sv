class single_class;
	rand bit [2:0] var1;
	rand byte var2;
	constraint c1 {
		var2 >= 0;
		var2 <= 250;
	}

	mailbox #(single_class) mbox1 = new();
	
	function void disp_prop();
		$display("values are : %0d %0d", var1, var2);
	endfunction

	function void disp_mbx(single_class obj1);
		$display("values are : %0p", mbox1.get(obj1));
	endfunction

endclass

module mail_methods();
	single_class obj1 = new();
	initial begin
		obj1.randomize();
		obj1.mbox1.put(obj1);
		obj1.disp_prop();
		obj1.disp_mbx(obj1);
		obj1.mbox1.get(obj1);
	end
endmodule
