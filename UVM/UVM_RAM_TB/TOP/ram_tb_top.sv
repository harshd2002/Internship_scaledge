////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_tb_top.sv
//File_Path    : 
//Class_Name   : ram_tb_top               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

module ram_tb_top();
  
  //importing files from package
  import ram_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //clock and reset signal
  bit clk, rst;

  //interface instance
  ram_intf intf(clk, rst);

  //RTL instantiation
  ram dut(.clk(clk),
          .rst(rst),
          .ram_en(intf.ram_en),
          .wr_enb(intf.wr_enb),
          .rd_enb(intf.rd_enb),
          .wr_addr(intf.wr_addr),
          .rd_addr(intf.rd_addr),
          .wr_data(intf.wr_data),
          .rd_data(intf.rd_data)
          );

  //task reset
  task reset();
    rst = 1;
    intf.ram_en  = 0;
    intf.wr_enb  = 0;
    intf.wr_addr = 0;
    intf.wr_data = 0;
    intf.rd_enb  = 0;
    intf.rd_addr = 0;
    intf.rd_data = 0;
    repeat(2) @(posedge clk);
    rst = 0;
  endtask

  initial begin
    //setting virtual interface 
    uvm_config_db#(virtual ram_intf)::set(null, "uvm_test_top.env_h.agt_h.*", "ram_intf", intf);
  end
  
  //initial block for test run
  initial begin
    fork
      reset();
      run_test();
    join
  end

  //clock generation
  always #5 clk = ~clk;
  
endmodule
