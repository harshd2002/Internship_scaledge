//testbench

module tb();

reg clk,reset;
reg [1:0] coin;

wire Product, Change;

vending_machine_FSM dut(
  .clk(clk),
  .reset(reset),
  .coin(coin),
  .Product(Product),
  .Change(Change)
  );

// task for passing coin.
  task value(input [1:0] c);  
    coin = c;
  endtask

// task for performing reset.
  task reset_t(input r);
    reset = r;
  endtask

// task for delay
  task delay(input [2:0] d);
    repeat(d) @(negedge clk);
  endtask

// generating clock.
  always begin #5 clk = !clk; end

// initializing
  initial begin
    clk = 1'b0;
    reset = 0;
    coin = 0;
  end

  initial begin
    delay(2);
    // deasserting reset to start operation.
    reset_t(1);

    // Entering coin 1 three times.
    value(1);
    delay(4);

    // Entering coin 2 two times.
    value(2);
    delay(3);

    // coin = 1 and coin = 2.
    value(1);
    delay(2);

    // asserting reset in between for 5 cycle then deasserting
    reset_t(0);
    delay(5);
    reset_t(1);

    // passing coin = 2 for 2 times
    value(2);
    delay(2);

    // coin = 2 and coin = 1.
    value(2);
    delay(1);
    value(1);
  end
endmodule
