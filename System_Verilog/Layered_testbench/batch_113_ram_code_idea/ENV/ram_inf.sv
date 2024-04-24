///////////////////////////////////
//
//      HEADER (file_name, author name, module/intreface/class name,
//              discription, version, date, time
//   FILE_NAME : 
//
/////////////////////////////////////

//Gaurd Statment to avoid multiple compilation of a file
`ifndef RAM_INF_SV
`define RAM_INF_SV
//typedef RAM_INF_SV

interface ram_inf(input clk);

  logic rst;
  logic wr_enb;
  logic [(`ADDR_WIDTH-1):0] wr_addr;
  //like this add all other IO signals
  
  //4 clocking block
  clocking wdr_cb @(posedge clk);
    default input #1 output #1;
	input rst;
	output wr_enb, wr_addr, wr_data;
  endclocking
  
  :
  
  modport WDR_MP (clocking wdr_cb);



endinterface




`endif
