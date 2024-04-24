module example2();
  
  reg a, b;										//variable to observe
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
	end

	initial begin

		//0 time stamp
    a = 0;										//blocking a
    b <= 0;										//non-blocking b
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);

    #2;
		//2 time stamp
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);
    a = #2 1;										//blocking a

		//4 time stamp
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);
    b <= #2 1;										//non-blocking b
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);

    #2;
		//6 time stamp
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);
    a = #2 0;										//blocking a

		//8 time stamp
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);
    b <= #2 0;										//non-blocking b
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);

    #2;
		//10 time stamp
    $display("%d  %d", a, b);
    $strobe("%d  %d", a, b);

    #100;
    $stop;
    
  end
  
endmodule
