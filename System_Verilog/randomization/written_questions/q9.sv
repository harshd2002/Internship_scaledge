//Randomize diagonal values of an array of pixels such that:
//		1. every pixel should be greater than its previous values and diagonally previous values

class rand_8 #(parameter SIZE = 16);
								
	typedef byte unsigned arr[][];
	rand arr arr_p;
	constraint c1 {
		arr_p.size() == SIZE;
		foreach(arr_p[i])
			arr_p[i].size() == SIZE;
	}
	constraint c2 {
		foreach(arr_p[i]) {
			if(i != (SIZE-1)) {
				arr_p[i+1][i+1] > arr_p[i+1][i];
				arr_p[i+1][i+1] > arr_p[i][i];
			}
		}
	}
	function void disp();
		$display("Randomized Pattern.");
		foreach(arr_p[i]) begin
			$display(" %3p", arr_p[i]);
		end
		foreach(arr_p[i]) begin
			$display(" %d %d %d ", arr_p[i-1][i-1], arr_p[i][i-1], arr_p[i][i]);
		end
	endfunction
endclass

module q8();
	rand_8 #(5) obj1 = new();
	initial begin
		$display("-------------------------------------------");
			obj1.randomize();
			obj1.disp();
		$display("-------------------------------------------");
	end
endmodule
