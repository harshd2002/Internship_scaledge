module tb();
  
reg [7:0] in;
reg       enable;

wire [2:0] out;

priority_encoder_8x3 dut(
  .in_i(in),
  .enable_i(enable),
  .out_o(out)
  );

  task value(input [7:0] i);
    in = i;
  endtask

  initial begin 
    enable = 1'b0;
    #10;
    enable = 1'b1;
    #10;

    // declaring the input.
    value(8'hff);
    #10;
    value(8'h7f);
    #10;
    value(8'h3f);
    #10;
    value(8'h1f);
    #10;
    value(8'h0f);
    #10;
    value(8'h07);
    #10;
    value(8'h03);
    #10;
    value(8'h01);
    #10;
    value(8'h00);
    #10;
  end

endmodule
