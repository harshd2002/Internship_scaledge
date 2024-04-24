module array_manipulation();

	int arr_q[$], ind[$];
	int odd_sum, even_sum;

	initial begin
		repeat(20) begin
			arr_q.push_front($urandom%256);
		end
		$display("-------------------------------------");
		$display("arr_q = %0p", arr_q);
		$display("-------------------------------------");
		//sum of odd index without method;
		foreach(arr_q[i]) begin
		if(arr_q[i]%2 != 0)
			odd_sum += arr_q[i];
		end
		$display("sum of odd values is: %0d", odd_sum);
		$display("-------------------------------------");
		ind = arr_q.find() with (item[0]%2 == 0);
		even_sum = ind.sum();
		ind.delete();
		$display("sum of even valus is: %0d", even_sum);
		$display("-------------------------------------");
		foreach(arr_q[i]) begin
		if(arr_q[i] < 10)
			ind.push_front(arr_q[i]);
		end
		$display("elements less than 10 without method are: %0p", ind);
		ind.delete();
		$display("-------------------------------------");
		ind = arr_q.find() with (item < 10);
		$display("elements less than 10 with method are: %0p", ind);
		$display("-------------------------------------");
	end

endmodule
