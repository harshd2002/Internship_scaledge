module priority_encoder_8x3(
  input wire [7:0] in_i,
  input wire       enable_i, 
  output wire [2:0] out_o
  );
  
  // Driving the output.
  reg [2:0] out;
  assign out_o = out;
  
  // enable is active low.
  always @(*) begin 
    if(!enable_i) 
      out = 3'bxxx;
    else begin
      if(in_i[7]) 
        out = 3'b111;
      else if(in_i[6])
        out = 3'b110;
      else if(in_i[5])
        out = 3'b101;
      else if(in_i[4])
        out = 3'b100;
      else if(in_i[3])
        out = 3'b011;
      else if(in_i[2])
        out = 3'b010;
      else if(in_i[1])
        out = 3'b001;
      else if(in_i[0])
        out = 3'b000;
      else 
    	  out = 3'bxxx;
    end
  end

endmodule
