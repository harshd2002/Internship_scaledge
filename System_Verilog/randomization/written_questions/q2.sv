//Randomize a 32 bit variable B such that it has values between 
			//(I) 	15 to 30 when another variable a is between 5 to 20,
			//(II) 	45 to 70 if a is between 20 to 38,
			//(III) Else 80 to 100

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
			if(!obj1.randomize())
				$error("Randomization Failed");
			obj1.disp();
		end
		obj1.A = 12;
		repeat(5) begin
			if(!obj1.randomize())
				$error("Randomization Failed");
			obj1.disp();
		end
		obj1.A = 62;
		repeat(5) begin
			if(!obj1.randomize())
				$error("Randomization Failed");
			obj1.disp();
		end
		obj1.A = 32;
		repeat(5) begin
			if(!obj1.randomize())
				$error("Randomization Failed");
			obj1.disp();
		end

	end
endmodule
