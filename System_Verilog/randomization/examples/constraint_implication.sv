class types;
	rand bit [2:0] a;
	rand bit [2:0] b;
	constraint c1 { 
		(a >= 0 && a <= 4) -> ( b == 0);
	}
	constraint c2 {
		solve a before b;
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
			if(!obj1.randomize()) 
				$error("Randomization failed.");
			obj1.disp(obj1);
		end
	end

endmodule
