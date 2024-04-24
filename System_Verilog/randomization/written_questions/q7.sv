//Randomize an array as below pattern
//	1
//	2		4
//	3		6		9
//	4		8		12	16
//	5		10	15	20	25
//	.....
//	.....

class rand_7 #(parameter SIZE = 4);
	typedef byte unsigned arr[][];
	rand arr arr_p;
	constraint c1 {
		arr_p.size() == SIZE;
		foreach(arr_p[i])
			arr_p[i].size() == i+1;
	}
	constraint c2 {
		foreach(arr_p[i, j]) {
				arr_p[i][j] == (i+1)*(j+1);
		}
	}
	function void disp();
		$display("Randomized Pattern.");
		foreach(arr_p[i])
		$display(" %d", arr_p[i]);
	endfunction
endclass

module q7();
	rand_7 #(10) obj1 = new();
	initial begin
		$display("-------------------------------------------");
			obj1.randomize();
			obj1.disp();
		$display("-------------------------------------------");
	end
endmodule
