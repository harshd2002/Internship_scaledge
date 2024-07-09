////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_intf.sv
//File_Path    : 
//Class_Name   : ram_intf               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

//interface for RAM

interface ram_intf(input clk, input rst);
 //write signals
  logic       ram_en;
  logic       wr_enb;
  logic [7:0] wr_addr;
  logic [7:0] wr_data;

 //read signals
  logic       rd_enb;
  logic [7:0] rd_addr;
  logic [7:0] rd_data;

  clocking drv_cb @(posedge clk);
    default input #0 output #5;
    output ram_en, wr_enb, rd_enb, wr_addr, rd_addr, wr_data;
  endclocking

  clocking mon_cb @(posedge clk);
    default input #0 output #0;
    input ram_en, wr_enb, rd_enb, wr_addr, rd_addr, wr_data, rd_data;
  endclocking
  
  modport drv_mp(clocking drv_cb);
  modport mon_mp(clocking mon_cb);

endinterface
