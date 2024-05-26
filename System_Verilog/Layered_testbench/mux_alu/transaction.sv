////////////////////////////////////////////////////////////////////////////////////////////////////
// Inputs - [31:0] A, [31:0] B, [31:0] C, [31:0] D, [3:0] Sel
// Output - [32:0] OUT
// When Sel=0 => Out = A & B;
// When Sel=1 => Out = A - B
// When Sel=2 => Out = A + B
// When Sel=3 => Out = A * A // you can program value A such a way out will be more thhat 32 bits
// When Sel=4 => Out = B * B
// When Sel=5 => Out = 'hFFFF & A
// When Sel=6 => Out =  'h0000 & B
// When Sel=7 => Out = Hit Invalid Bins
////////////////////////////////////////////////////////////////////////////////////////////////////

//transaction class

class transaction #(byte IN_WIDTH = 32, byte SEL_WIDTH = 4);

	//enum to determine operation 
	//ops_e value
	//AND_AB: bitwise AND
	//SUB: substraction
	//ADD: addition
	//SQ_A: square of A
	//SQ_B: square of B
	//MASK1_A: masking A with 'hFFFF
	//MASK0_B: masking B with 'h0000
	//INVALID: not valid
	rand operation ops_e;

	//input variables
	rand bit [IN_WIDTH-1:0] A, B, C, D;
	//select line
	bit [SEL_WIDTH-1:0] sel_i;
  bit enb;
	//output 
	bit [IN_WIDTH:0] out;

	//print data
	task print_trans(string block);
		$display("-------------------%0s class-------------------", block);
		$display("Time\t|\tName\t\t|\tValue");
		$display("-------------------------------------------------------");
		$display("%0t\t|\tENABLE\t\t|\t%0d", $time, enb);
		$display("%0t\t|\tSEL\t\t|\t%0d", $time, sel_i);
		$display("%0t\t|\tA\t\t|\t%0h", $time, A);
		$display("%0t\t|\tB\t\t|\t%0h", $time, B);
		$display("%0t\t|\tC\t\t|\t%0h", $time, C);
		$display("%0t\t|\tD\t\t|\t%0h", $time, D);
		$display("%0t\t|\tOUT\t\t|\t%0h", $time, out);
		$display("-------------------------------------------------------");
	endtask

  //postrandomize manipulations
  function void post_randomize();
    enb = 1;
  endfunction

endclass
