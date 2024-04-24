class types;
	rand byte a;
	randc byte b;
	constraint c1 { 
	 	a < 50;
		soft a > 40;
	}
	function void disp(types obj);
		$display("Values are: %p", obj);
	endfunction
endclass

module constraint_types();

	types obj1;

	initial begin
		obj1 = new();
		repeat(20) begin
			obj1.randomize() with { a < 10; a > 0; b < 15; b > 0;};
			obj1.disp(obj1);
		end
	end

endmodule
