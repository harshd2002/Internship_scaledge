class unknown_rand;
	rand logic var1;
	
	function void disp();
		$display("value is: %b", var1);
	endfunction
endclass

module que_6();
	unknown_rand obj1 = new();
	initial begin
		$display("----------------------------------");
		repeat(15) begin
			obj1.randomize() with {var1 inside {0, 1, 1'bx, 1'bz};};
			obj1.disp();
		end
		$display("----------------------------------");
	end

endmodule
