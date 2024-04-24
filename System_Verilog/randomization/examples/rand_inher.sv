class parent;
	rand byte prop1;
	randc byte prop2;
	constraint consp {
		prop1 > 25;
		prop1 < 30;
		prop2 < 125;
		prop2 > 120;
	}
	function void disp(parent obj);
		$display("parent class: %p", obj);
	endfunction
endclass

class child extends parent;
	randc byte prop3;
	rand byte prop4;
	static int a = 27;
	constraint consp {
		prop3 < 20;
		prop4 > 10;
		prop4 < 35;
		prop1 > a;
		prop1 < 29;
		prop2 < 125;
		prop2 > 120;
	}
	function void disp(child obj);
		$display("child class: %p", obj);
	endfunction
endclass

module rand_inher();
	child obj_c1;
	parent obj_p1;
	
	initial begin
		obj_c1 = new();
		obj_p1 = new();
		$display("-----------------------------------------------------------------------");
		repeat(25) begin
			obj_c1.randomize();
			obj_c1.disp(obj_c1);
		end
		$display("-----------------------------------------------------------------------");
		obj_c1.rand_mode(0);
		//obj_p1.rand_mode(0);
		repeat(10) begin
			obj_p1.randomize();
			obj_p1.disp(obj_p1);
		end
		$display("-----------------------------------------------------------------------");
		repeat(10) begin
			obj_c1.randomize();
			obj_c1.disp(obj_c1);
		end
		$display("-----------------------------------------------------------------------");
		obj_c1.rand_mode(1);
		obj_p1 = obj_c1;
		repeat(10) begin
			obj_p1.randomize();
			obj_p1.disp(obj_p1);
		end
		$display("-----------------------------------------------------------------------");
		obj_c1.a = 26;
		repeat(10) begin
			obj_p1.randomize();
			obj_p1.disp(obj_p1);
		end
		$display("-----------------------------------------------------------------------");
		obj_c1.rand_mode(0);
		repeat(10) begin
			obj_p1.randomize();
			obj_p1.disp(obj_p1);
		end
		$display("-----------------------------------------------------------------------");
		repeat(10) begin
			obj_c1.randomize();
			obj_c1.disp(obj_c1);
		end
		$display("-----------------------------------------------------------------------");
		obj_p1.rand_mode(1);
		repeat(10) begin
			obj_p1.randomize();
			obj_p1.disp(obj_p1);
		end
		$display("-----------------------------------------------------------------------");

	end

endmodule
