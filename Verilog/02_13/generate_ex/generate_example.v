//Full Adder module
module FA(input num1_in,num2_in,cin,
          output sum_out,
          output carry_out
         );
  
	 	assign sum_out = num1_in^num2_in^cin;										//Sum
    assign carry_out = (num1_in&num2_in) + (num2_in&cin) + (num1_in&cin);	//Carry
  
endmodule

//Ripple Carry Adder module where Full adder module is instantiated using generate block (generate for loop)
module rca_nbit
  #(parameter n = 4)
  (input [n-1:0] num1_in,num2_in,
   input cin,
   output [n-1:0] sum_out,
   output carry_out
  );
  
  wire [n:0] c;
  assign c[0] = cin;
  assign carry_out = c[n];
  
	//Variable for generate loop index variable
  genvar i;
  
//	generate for loop for Full Adder instantiation
  generate
    
    for(i=0;i<n;i=i+1) begin
      FA aa_i(.num1_in(num1_in[i]), .num2_in(num2_in[i]), .cin(c[i]), .sum_out(sum_out[i]), .carry_out(c[i+1]));
    end
    
  endgenerate
  
endmodule
