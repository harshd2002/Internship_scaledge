//Randomize an array of pixels of size 16x16 such that:
//		1. black pixels > 20% of white pixels

class rand_8 #(parameter SIZE = 16,
								parameter WHITE = 40,
								parameter BLACK = 48);
								
	typedef byte unsigned arr[][];
	rand arr arr_p;
	constraint c1 {
		arr_p.size() == SIZE;
		foreach(arr_p[i])
			arr_p[i].size() == SIZE;
	}
	constraint c2 {
		foreach(arr_p[i, j])
		arr_p[i][j] dist{0:=WHITE, 255:=BLACK};
	}
	function void disp();
		$display("Randomized Pattern.");
		foreach(arr_p[i])
		$display(" %3p", arr_p[i]);
	endfunction
endclass

module q8();
	rand_8 obj1 = new();
	initial begin
		$display("-------------------------------------------");
			obj1.randomize();
			obj1.disp();
		$display("-------------------------------------------");
	end
endmodule
