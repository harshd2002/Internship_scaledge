module associative_array();

	int arr_a[int ];

	initial begin

		while(arr_a.size() != 10) begin
			arr_a[$urandom%50] = $urandom%256;
		end
		$display("-------------------------------------");
		foreach(arr_a[i])
			$display("arr_a[%0d] = %0d", i, arr_a[i]);
		$display("-------------------------------------");
			$display("arr_a:  %0p",arr_a);
		$display("-------------------------------------");
		arr_a.delete(arr_a.find_index() with (item < 100));
		arr_a.delete(23);
		arr_a.delete(36);
		arr_a.delete(46);
			$display("arr_a:  %0p",arr_a);
		$display("-------------------------------------");
		$display("-------------------------------------");

	end

endmodule
