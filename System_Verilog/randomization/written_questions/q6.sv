//Randomize an array such that subsequent rows should have values greater than previous ones.

class rand_6 #(parameter SIZE = 4);
	rand byte unsigned arr_r[SIZE][SIZE];
	rand byte arr_c[SIZE][SIZE];
	constraint c1 {
		foreach(arr_r[i, j]) {
			if(i != (SIZE - 1))
				arr_r[i][j] < arr_r[i+1][j];
		}
		foreach(arr_c[i, j]) {
			if(j != (SIZE - 1))
				arr_c[i][j] < arr_c[i][j+1];
		}
	}
	function void disp();
		$display("row randomization: %p", arr_r);
		$display("column randomization: %p", arr_c);
	endfunction
endclass

module q6();
	rand_6 #(4) obj1 = new();
	initial begin
		$display("-------------------------------------------");
		repeat(5) begin
			obj1.randomize();
			obj1.disp();
		$display("-------------------------------------------");
		end
	end
endmodule
