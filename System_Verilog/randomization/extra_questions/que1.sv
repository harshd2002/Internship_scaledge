//Generate pattern "0102030405" using randomization in array and a single element

class pattern;
	rand bit [2:0] single;
	rand bit [2:0] arr_r[10];
	static local bit[3:0] count = 0;
	constraint c1 {
		foreach(arr_r[i]) {
			if(i%2 == 1)
				arr_r[i] == ((i/2) + 1);
			else
				arr_r[i] ==0;
		}
		if(count%2 == 1)
			single == ((count/2) + 1);
		else
			single == 0;
	}
	function void post_randomize();
		count++;
		if(count == 10)
			count = 0;
	endfunction
	function void disp_arr();
		$display("array pattern: %p", arr_r);
	endfunction
	function void disp_element();
		$display("element value: %0d", single);
	endfunction
endclass

module que_1();
	pattern obj1 = new();
	initial begin
			obj1.randomize();
			obj1.disp_arr();
			obj1.disp_element();
		repeat(10) begin
			obj1.randomize();
			obj1.disp_element();
		end
	end
endmodule
