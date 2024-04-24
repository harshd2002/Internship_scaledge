class rand_class #(int size=8);
	rand bit [0:size-1] pro1;
	static int count;
	static enum byte {p0 = 0, p1=128, p2 = 64,p3 = 32, p4=16, p5=8, p6=4, p7=2, p8=1, p9=255} pattern;
	constraint patt {
			pro1 == pattern.next();
			increase();
	}
	function void increase();
		pattern = pattern.next();
	endfunction
	/*function void post_randomize();
		$display("values are: %8b", pro1);
	endfunction
	*/function void disp(rand_class obj);
		$display("values are: %8b", pro1);
	endfunction
endclass

module pattern_consrtaint();
	rand_class #(8) obj1;
	initial begin
		obj1 = new();
		obj1.disp(obj1);
		repeat(20) begin
			obj1.randomize();
		end
	end

endmodule
