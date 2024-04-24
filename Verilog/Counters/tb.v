
module tb;

  reg clk, rst;
  wire [3:0] count;

  counter dut(.clk(clk), .rst(rst), .count(count));

  initial begin

    clk = 0;
    forever #5 clk = ~clk;

  end

  initial begin

    rst = 0;
    #10 rst = 1;
    #100;
    $finish;

  end

endmodule
