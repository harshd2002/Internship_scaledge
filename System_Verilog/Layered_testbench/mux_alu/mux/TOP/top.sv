`ifndef MUX_TOP_SV
`define MUX_TOP_SV
  

`include "interface.sv"
module top;
  import pkg_1::*;



  bit clk;
  bit rst;

  inf interface_1(clk);

  mux dut(.clk(clk),.rst(rst),.A(interface_1.A),.B(interface_1.B),.C(interface_1.C),.D(interface_1.D),.sel(interface_1.sel),.out(interface_1.out));
  test tst;
  initial begin
    tst=new();
    tst.build();
    tst.connect(interface_1);
    tst.run();

    #100;
    $finish;
  end


 task reset();
 fork
  forever @(reset_call)begin
    interface_1.rst=1;
    #7 interface_1.rst=0;
  end
  join_none
  endtask

  initial begin
    interface_1.rst=1;
    #7 interface_1.rst=0;
  end



  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  
  endmodule
`endif
