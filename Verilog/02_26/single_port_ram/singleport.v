module singleport#(parameter WIDTH = 8, DEPTH = 64, ADDR = 6)(
	
	input cs, wr, clk, rstn,

	input [ADDR-1:0] addr,

	//Bidirectional Bus 
	inout [WIDTH-1:0] data);


	//Memory of 64x8 
	reg [WIDTH-1:0] memory [DEPTH-1:0];

	//Temperory variable for Data
	reg [WIDTH-1:0] datatmp;

	integer i;
	//assign data_in = datatmp;
	
	//Read logic this way coz dont want to take an extra temp variable for data assignments
	assign data = (cs && !we) ? memory[addr] : 8'hzz;

	always @(posedge clk or negedge rstn) begin
		if(!rstn) begin
			//datatmp <= 8'd0;
			for(i=0;i<64;i=i+1) begin
			memory[i] <= 8'd0;
			end	
		end

		else begin
			if(cs) begin
				if(wr) memory[addr] <= data;
				//else data_in <= memory[addr];
			end
		end
	end



endmodule
