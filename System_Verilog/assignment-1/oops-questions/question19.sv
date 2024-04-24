class singleton;
	local static bit count;
	int p1;

	static function static singleton make(singleton obj);
		singleton ret_add;
		if(!count) begin
			obj = new();
			ret_add = obj;
			count++;
			$display("first time created");
		end
		else
			$display("already created");
		return ret_add;
	endfunction
endclass

module singleton_class();

	singleton obj1, obj2;

	initial begin
		obj1 = singleton::make(obj1);
		obj2 = singleton::make(obj2);
		obj1.p1 = 1;
		$display("value1 is: %0p", obj1);
		$display("address1 is: %0d", obj1);
		obj2.p1 = 2;
		$display("value2 is: %0p", obj2);
		$display("address2 is: %0d", obj2);
	end

endmodule
