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

//enum type variable to select operation type
typedef enum {BIT_AND, SUB, ADD, SQ_A, SQ_B, MASK1_A, MASK0_B, INVALID} operation;

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
	//output 
	bit [IN_WIDTH:0] out;

	/*//print data
	task print_trans();
		$display("-------------------transaction class-------------------");
		$display("Time\t|\tName\t\t|\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\t|\twr_enbl\t\t|\t%0d", $time, wr_enbl);
		$display("%0d\t|\trd_enbl\t\t|\t%0d", $time, rd_enbl);
		$display("%0d\t|\twr_addr\t\t|\t%0d", $time, wr_addr);
		$display("%0d\t|\trd_addr\t\t|\t%0d", $time, rd_addr);
		$display("%0d\t|\twr_data\t\t|\t%0d", $time, wr_data);
		$display("%0d\t|\trd_data\t\t|\t%0d", $time, rd_data);
		$display("-------------------------------------------------------");
	endtask
*/
endclass
