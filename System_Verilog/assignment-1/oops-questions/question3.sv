class class_3;
	int num1, num2;
	bit [0:16] sum;
	function void add();
		sum = num1 + num2;
	endfunction
endclass

module addition_method();

	class_3 objs[10];
	shortint a=1, b=2;

	initial begin
		foreach(objs[i]) begin
			objs[i] = new();
			{objs[i].num1, objs[i].num2} = {{$random(a)}%65536, {$random(b)}%65536};
			objs[i].add();
			$display("properties of object[%0d] are: %0p", i, objs[i]);
		end

	end

endmodule
