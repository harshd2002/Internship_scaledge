//randomize a queue array
//--> Store only even values
//--> Bound queue in the range 50 to 100

class queue_even;

	rand bit [0:6] arr_q[$];

	constraint c1 {
		arr_q.size() >= 50;
		arr_q.size() <= 100;
	}
	constraint c2 {
		foreach(arr_q[i]) {
			arr_q[i] % 2 == 0;
		}
	}
	function void disp(queue_even obj);
		$display("%0d randomized values are: %p",obj.arr_q.size(), obj);
	endfunction

endclass

module queue_even_rand();

	queue_even obj1;
	initial begin
		obj1 = new();
		repeat(5) begin 
			obj1.randomize();
			obj1.disp(obj1);
		end
	end

endmodule
