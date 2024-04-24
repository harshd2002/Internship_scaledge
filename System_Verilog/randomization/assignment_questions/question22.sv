//randomize an array as below pattern
// 1 2 3 4 5
// 2 3 4 5 6
// 3 4 5 6 7
// 4 5 6 7 8
// 5 6 7 8 9

class pattern22;

	rand bit [3:0] arr[5][5];

	constraint c1 {
		foreach(arr[i]) {
			foreach(arr[i][j]) {
				arr[i][j] == i+j+1;
			}
		}
	}

	function void disp(pattern22 obj);
		$display("values are: %p", obj);
	endfunction

endclass

module array_pattern_22();
	
	pattern22 obj1;

	initial begin
		obj1 = new();
			obj1.randomize();
			obj1.disp(obj1);
		end
	end

endmodule
