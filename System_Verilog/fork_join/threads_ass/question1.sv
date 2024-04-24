class checker_class;
	rand bit a;
	bit b;
	constraint c1 {
		a dist{0:=30, 1:=70};
	}
	function void disp();
		$display("values are: a = %0b, b = %0b", a, b);
	endfunction
	function void post_randomize();
		b = a;
	endfunction
endclass

module question1();
	checker_class obj1;
	initial begin
		obj1 = new();
		repeat(15) begin
			if(!obj1.randomize())
				$display("Randomizaion failed.");
			obj1.disp;
		end
	end
	initial begin
		forever begin
			@(posedge obj1.a);
						$display("entered forever");
				fork: F1
						$display("entered fork_join");
					begin: B1
						wait(obj1.b == 1);
						$display("b is updated.");
					end
					begin: B2
						#15ns;
						#1;
						$display("b is not updated in 15ns");
					end
				join_any
				disable F1;
		end
	end
endmodule
