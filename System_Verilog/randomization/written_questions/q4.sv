//Override a constraint without using soft keyword.

class range;
	rand int B;
	int A;
	constraint c1 {
		if( A inside {[5:20]})
			B inside {[15:30]};
		else if( A inside {[20:38]})
			B inside {[45:70]};
		else
			B inside {[80:100]};
	}
	function void disp();
		$display("value of B is %0d when A is %0d.", B, A);
	endfunction
endclass

module q2();
	range obj1;
	initial begin
		obj1 = new();
		obj1.A = 2;
		repeat(5) begin
			if(!(obj1.randomize() with {B inside {[35:40]};}))			//inline constraint is passed but it wil not work since soft keyword is not declared
				$error("Randomization Failed");
			obj1.disp();
		end
		obj1.A = 12;
		obj1.constraint_mode(0);
		repeat(5) begin
			if(!obj1.randomize())					//overrided constraint by turning off the constraint
				$error("Randomization Failed");
			obj1.disp();
		end
		obj1.A = 62;
		obj1.constraint_mode(1);
		repeat(5) begin
			if(!(std::randomize(obj1.B) with {obj1.B inside {[35:40]};}))		//overrided constraint by using scope randomization
				$error("Randomization Failed");
			obj1.disp();
		end
	end
endmodule
