//testbench for ripple carry adder
module tb;
  parameter n = 4;
  reg [n-1:0] a,b;		//two n bit numbers which required to be added.
  reg cin;						// carry from any previous caicuit.
  wire [n-1:0] sum;		//final sum output
  wire cout;					//to store generated carry output
  
// instantiating  tb with design
  rca_nbit dut(.num1_in(a), .num2_in(b), .cin(cin), .sum_out(sum), .carry_out(cout));

//task to load input values in ripple carry adder
	task load(input [n-1:0] num_1, num_2,
						input carry_in
						);
						begin
							a = num_1;
							b = num_2;
							cin = carry_in;
						end
	endtask

//task to generate delay
	task delay(input integer delay);
	begin
		#delay;
	end
	endtask
  
//giving test cases
  initial begin
  	$dumpfile("dump.vcd");
  	$dumpvars(1);
	end
	initial begin

    $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b\n",a,b,cin,sum,cout);
		
		//bringing to known state
		load('d0, 'd0, 'd0);
    delay('d15);

		//giving max value (boundry condition)
		load('d15, 'd15, 'd1);
    delay('d15);

		//giving min value (boundry condition)
		load('d0, 'd0, 'd0);
    delay('d15);

		//checking for overflow (output carry 1)
		load('d10, 'd13, 'd0);
    delay('d15);

    delay(50);
    $finish;
    
  end
  
endmodule
