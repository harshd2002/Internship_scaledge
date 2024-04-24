//randomize two variables such that they differ by only 5 bits.

class differ_5 #(parameter DIF = 5);
	rand bit [31:0] a, b;
	bit[4:0] index[DIF];
	constraint c1 {
		foreach(a[i]) {
			if(i inside {index})
				a[i] != b[i];
			else
				a[i] == b[i];
		}
	}
	function void pre_randomize();
		std::randomize(index) with {unique {index};};
		$display("%p",index);
	endfunction
	function void disp();
		$display("a: %b \nb: %b", a, b);
	endfunction
endclass

module que_4();
	differ_5 #(.DIF(5)) obj1 = new();
	initial begin
		$display("----------------------------------");
		repeat(15) begin
			if(!obj1.randomize())
				$warning("Randomization Failed");
			obj1.disp();
		$display("----------------------------------");
		end
	end
endmodule
