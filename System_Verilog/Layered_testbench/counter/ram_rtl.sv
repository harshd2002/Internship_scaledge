//RAM design
`define ADDR_WIDTH 8
`define DEPTH 256
`define DATA_WIDTH 8 
module ram_rtl (clk,
            rst,
            wr_enbl,
            wr_addr,
            wr_data,
            rd_enbl,
            rd_addr,
            rd_data);

//port direction
  input clk, rst;

 //write signals
  input                   wr_enbl;
  input [`ADDR_WIDTH-1:0] wr_addr;
  input [`DATA_WIDTH-1:0] wr_data;

 //read signals
  input                        rd_enbl;
  input      [`ADDR_WIDTH-1:0] rd_addr;
  output reg [`DATA_WIDTH-1:0] rd_data;


 //internal memory
 reg [`DATA_WIDTH-1:0] ram [0:`DEPTH-1];

 reg [`ADDR_WIDTH:0] i;

 //implementation
 always @(posedge clk)
  if (rst) begin
     rd_data <= `DATA_WIDTH'd0;
	 //memory initialisation
     for (i=0;i<`DEPTH;i=i+1) 
         ram[i] <= `DATA_WIDTH'd0;
  end
  else begin
    //read logic
     if (rd_enbl)
        rd_data <= ram[rd_addr];
    //write logic
     if (wr_enbl)
        ram[wr_addr] <= wr_data;
  end

endmodule
