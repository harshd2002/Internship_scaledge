////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : fifo_tb_top.sv
//File_Path    : 
//Class_Name   : fifo_tb_top               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

`ifndef AFIFO_TB_TOP
`define AFIFO_TB_TOP

module fifo_tb_top();
  
  //importing files from package
  import fifo_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //clock and reset signal
  bit wr_clk, rd_clk, rstn;

  //interface instance
  fifo_intf intf(wr_clk, rd_clk, rstn);

  //RTL instantiation
  async_fifo dut(.wr_clk(wr_clk),
                 .rd_clk(rd_clk),
                 .rstn(rstn),
                 .wr_en(intf.wr_enb),
                 .rd_en(intf.rd_enb),
                 .wr_data(intf.wr_data),
                 .rd_data(intf.rd_data),
                 .full(intf.full),
                 .empty(intf.empty),
                 .almost_full(intf.almost_full),
                 .almost_empty(intf.almost_empty),
                 .overflow(intf.overflow),
                 .underflow(intf.underflow)
                 );

  //task reset
  task reset(byte unsigned del = 10);
    rstn = 0;
    `uvm_info("top", "Reset Asserted", UVM_LOW)
    intf.wr_enb  = 0;
    intf.rd_enb  = 0;
    intf.wr_data = 0;
    #del;
    rstn = 1;
    `uvm_info("top", "Reset De-asserted", UVM_LOW)
  endtask

  initial begin
    //setting virtual interface 
    uvm_config_db#(virtual fifo_intf)::set(null, "", "fifo_intf", intf);
  end
  
  //initial block for test run
  initial begin
    fork
      run_test();
      reset(RST_TIME);
    join
  end

  //write clock generation
  always #3 wr_clk = ~wr_clk;

  //read clock generation
  always #5 rd_clk = ~rd_clk;
  
endmodule

`endif
