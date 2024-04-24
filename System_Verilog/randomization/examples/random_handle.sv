//we cannot randomize a handle
//Here, i tried to randomize a handle inside other class but address is not randomized.

class handle_c;
	rand bit [0:2] a;
	function void disp(handle_c obj);
		$display("values is:%p", obj);
	endfunction
endclass

class value_handle;
	rand handle_c obj_rand;
	function new();
		obj_rand = new();
	endfunction
endclass

module random_handle();
	handle_c obj1;
	value_handle obj2;

	initial begin
		obj1 = new();
		obj1.randomize();
		obj2 = new();
		repeat(20) begin
			obj2.randomize();
			$display("address is: %d", obj2.obj_rand);
			$display("value is: %p", obj2.obj_rand);
		end
	end

endmodule
