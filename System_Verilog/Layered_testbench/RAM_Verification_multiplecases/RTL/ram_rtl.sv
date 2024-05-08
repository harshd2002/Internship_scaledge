`define ADDR_WIDTH 4
`define DEPTH 16
`define DATA_WIDTH 8 
module ram_rtl(
	input logic clk,rstn,
	input logic wr_en,rd_en,
	input logic [(`ADDR_WIDTH-1):0] wr_addr, rd_addr,
	input logic [(`DATA_WIDTH-1):0] wr_data,
  output logic [(`DATA_WIDTH-1):0] rd_data
	);

	//memory declaration // [width] mem [depth];
	reg [(`DATA_WIDTH-1):0] mem [0:(`DEPTH-1)];

	always @(posedge clk or negedge rstn) begin
	$display("in dut %0t",$time);
		if(!rstn) begin
			rd_data <= 8'd0;
			foreach(mem[i]) begin
				mem[i] <= 8'd0;
			end
		end
		else begin
			
			//ram supports simultaneous read and write operations
			if(wr_en ) begin
				mem[wr_addr] <= wr_data;
			end

			if(rd_en) begin
				rd_data <= mem[rd_addr];
			end

		end
	end

endmodule
