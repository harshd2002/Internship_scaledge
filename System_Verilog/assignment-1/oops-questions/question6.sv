package counts;
	int count;
endpackage

class objects;
	static int obj_count;
	int a;
	byte b[3];
	function new();
		counts :: count++;
		obj_count++;
	endfunction
endclass

module count_objects();

	objects obj1, obj2;

	initial begin
	obj1 = new();
	obj2 = new();
	$display("------------------------------------------");
	$display("count is : %0d",counts :: count);
	$display("object count is : %0d",objects :: obj_count);
	$display("------------------------------------------");
	end

endmodule
