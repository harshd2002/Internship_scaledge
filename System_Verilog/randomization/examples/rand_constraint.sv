class constraint_rand;

	randc bit [2:0] p1;
	rand byte p2;
	rand bit [1:0] p3 [$];
	rand bit [1:0] p4 [];

	constraint prop2 {
		(p1 % 2) != 0;
		p2 > 100;
	}
	constraint array {
		p3.size() > 5;
		p3.size() < 15;
		p4.size() > 5;
		p4.size() < 15;
	}
	function void disp(constraint_rand obj);
		$display("values are: %p", obj);
	endfunction

endclass

module rand_constraint();

	constraint_rand obj1;

	initial begin
		obj1 = new();
		repeat(25) begin
			if(obj1.randomize() == 1)
				obj1.disp(obj1);
			else
				$display("cannot randomize");
		end
		obj1.randomize(); 
		obj1.disp(obj1);
	end

endmodule
