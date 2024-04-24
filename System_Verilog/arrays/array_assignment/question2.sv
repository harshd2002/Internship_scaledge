module associative_arr();

	int arr_a[int ];
	int i;

	initial begin
		$display("-------------------------------------------------------");
		while($size(arr_a)!=50) begin
			arr_a[1 + $urandom%100] = $urandom%256;
			i++;
		end
		foreach(arr_a[i]) begin
			$display("arr_a[%0d] = %0d", i, arr_a[i]);
		end
		$display("-------------------------------------------------------");
		if(arr_a.exists(2)) begin
			$display("arr_a[2] = %0d", arr_a[2]);
		end
		else begin
			$display("arr_a[2] doesn't exist");
		end
		if(arr_a.exists(45)) begin
			$display("arr_a[45] = %0d", arr_a[45]);
		end
		else begin
			$display("arr_a[45] doesn't exists");
		end
		$display("-------------------------------------------------------");
			$display("first element is:");
			$display("arr_a[%0p] = %0p", arr_a.find_first_index() with (item), arr_a.find_first() with (item));
		$display("-------------------------------------------------------");
			$display("last element is:");
			$display("arr_a[%0p] = %0p", arr_a.find_last_index() with (item), arr_a.find_last() with (item));
		$display("-------------------------------------------------------");
		$display("Size of associate array is: %0d", $size(arr_a));
		$display("-------------------------------------------------------");
			arr_a.delete(5);
			arr_a.delete(10);
			arr_a.delete(15);
			$display("Size of associate array is: %0d", $size(arr_a));
		$display("-------------------------------------------------------");
	end

endmodule
