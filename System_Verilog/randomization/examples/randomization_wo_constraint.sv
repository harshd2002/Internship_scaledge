class randomization;

	rand bit [3:0] p1;
	randc bit [2:0] p2;
	rand int p3;
	rand bit [1:0] p4 [];
	rand bit [1:0] p5 [byte];
	rand bit [1:0] p6 [$:5];
	rand struct{
		rand bit a;
	}s1;

	function new(int a);
		p4 = new[a];
		repeat(a) begin
			p5[{$random}%15] = 0;
			//p6.push_front(0); 
		end
		$display("values while declaring: %d %d %d %p %p %p %p", p1, p2, p3, p4, p5, p6, s1);
	endfunction

endclass

module randomization_rand();

	randomization obj1;

	initial begin
		obj1 = new(5);
		repeat(25) begin
			obj1.randomize();			//warning will be generated for impicite void casting because return values is not used
			$display("values are: %p. ", obj1);
		end
	end

endmodule
