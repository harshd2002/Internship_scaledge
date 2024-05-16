typedef enum bit[2:0]{SEL_0,SEL_1,SEL_2,SEL_3,SEL_4,SEL_5,SEL_6,SEL_7}selc_line;

class transaction;

  rand selc_line selc;
  rand bit[2:0]sel;
  rand bit[31:0]  A,B,C,D;
  bit[32:0]out;

 task print_trans();
		$display("-------------------transaction class-------------------");
		$display("Time\t|\tName\t\t|\tValue");
		$display("-------------------------------------------------------");
		$display("%0d\t|\tselc_property\t\t| %0s", $time, selc);
		$display("%0d\t|\tselc_line\t\t|\t%0d", $time, sel);
		$display("%0d\t|\tA\t\t|\t%0d", $time, A);
		$display("%0d\t|\tB\t\t|\t%0d", $time, B);
		$display("%0d\t|\tC\t\t|\t%0d", $time,C);
		$display("%0d\t|\tD\t\t|\t%0d", $time, D);
		$display("%0d\t|\tout\t\t|\t%0h", $time, out);
		$display("-------------------------------------------------------");
	endtask



endclass
