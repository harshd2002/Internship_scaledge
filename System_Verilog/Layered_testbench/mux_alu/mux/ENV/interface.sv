interface inf(input bit clk);
  
  bit rst;
  logic[31:0]A;
  logic[31:0]B;
  logic[31:0]C;
  logic[31:0]D;
  logic[2:0]sel;
  logic[32:0]out;
  

  clocking driver_dv@(posedge clk);
    default input #1 output #1;
    output A;
    output B;
    output C;
    output D;
    output sel;
  endclocking

  clocking monitor_mtr@(posedge clk);
    default input #0 output #1;
    input A;
    input B;
    input C;
    input D;
    input sel;
    input out;
  endclocking



  modport DRIVER(clocking driver_dv,input clk);
  modport MONITOR(clocking monitor_mtr,input clk);


endinterface
