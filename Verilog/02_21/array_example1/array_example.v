//statement:-
//make an array of width 16 bits and depth of 12 elements.
//make 2nd, 8th, and 11th bits to logic 0 of every element after entering some data.

module array_ex();
	parameter WIDTH = 16,
						DEPTH = 12;
	reg [WIDTH-1:0] arr [0:DEPTH-1];
	integer j;

//task to load random values in array
	task load_array();
	integer i;
	begin
		for(i=0;i<DEPTH;i=i+1) begin
			arr[i] = $random;
		end
	end
	endtask

//task to make nth(m_bit) bit 0
	task mask(input [$clog2(WIDTH) - 1:0] m_bit);
	integer i;
	begin
		for(i=0;i<DEPTH;i=i+1) begin
			arr[i][m_bit] = 1'b0;
		end
	end
	endtask

//initialising array and making given bits zero
	initial begin
		
		//assigning random values to array
		load_array();
		
		//printing values
		for(j=0;j<DEPTH;j=j+1) begin
			$display("initialy - arr[%0d] = %0b",j,arr[j]);
		end

		//making 2nd bit 0
		mask(2);
		//making 8th bit 0
		mask(8);
		//making 11th bit 0
		mask(11);
		
		//printing values after making given bits 0
		for(j=0;j<DEPTH;j=j+1) begin
			$display("after making 2nd, 8th and 11th bits 0 - arr[%0d] = %0b",j,arr[j]);
		end

	end
	
endmodule
