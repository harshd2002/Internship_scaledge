module tb;

  reg clk, rst, load;
  reg [3:0] din;
  wire [3:0] count;

  load_counter dut(.clk(clk), .rst(rst), .load(load), .din(din), .count(count));

  initial begin

    clk = 0;
    forever #5 clk = ~clk;

  end

  initial begin

    rst = 0;
    load = 0;
    din = 4'b0;

    #10 rst = 1;
    din = 4'b0011;
    #60 load = 1;
    #10 load = 0;
    #100;
    $finish;

  end

endmodule
