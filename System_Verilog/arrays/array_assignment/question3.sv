module queue_array();

	int arr_q[$] = '{1, 2 , 3, 4, 5};

	initial begin
		$display("--------------------------------------");
		$display("After initialization: %p", arr_q);
		$display("--------------------------------------");
		arr_q = {12, arr_q};
		$display("added an element without method : %p", arr_q);
		$display("--------------------------------------");
		arr_q.push_front(24);
		$display("added an element at begining with method : %p", arr_q);
		$display("--------------------------------------");
		arr_q.push_back(36);
		$display("added an element at end with method : %p", arr_q);
		$display("--------------------------------------");
		arr_q.insert(4, 48);
		$display("added on 4th index with method : %p", arr_q);
		$display("--------------------------------------");
		$display("poped first element with method : %p", arr_q.pop_front());
		$display("queue values are: %p", arr_q);
		$display("--------------------------------------");
		$display("poped last element with method : %p", arr_q.pop_back);
		$display("queue values are: %p", arr_q);
		$display("--------------------------------------");
		arr_q.delete(4);
		$display("queue values after deleting 4th index are: %p", arr_q);
		$display("--------------------------------------");
		while(arr_q.size())
			$display("element : %p", arr_q.pop_front());
		$display("--------------------------------------");

	end

endmodule
