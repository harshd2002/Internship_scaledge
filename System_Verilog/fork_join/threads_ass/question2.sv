class exp;
 	task write(bit [2:0] val);
 		$display($time," : ", val, " :Entering into the method");
 		#10;
	 	$display($time," : ", val, " :Exiting from the method");
 	endtask
endclass

module threads_q1();
	exp obj[$:3];
	exp obj1 = new();
	initial begin: ini
		//automatic int i;		//won't work since declared only once.
		obj.push_front(obj1);
		foreach(obj[i]) begin: loop1
		//obj1 = new();
		obj.push_front(obj1);
			//obj[i] = new();
		$display("queue %0d: %d",i, obj[i]);
		end
		foreach(obj[i]) begin: loop2
		automatic int j;
		j = $size(obj)-i-1;
		//j = i;
			fork
				obj[j].write(j);
			join_none
		end

		$display("completed");
	end
endmodule
