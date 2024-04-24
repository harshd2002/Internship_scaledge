module example1();

  integer a,b;
  
  initial begin

	//at 0 timestamp
  	a<=9;									//non-blocking assignmnet to a
    b<=5;									//non-blocking assignmnet to b
    $monitor("m1 a=%d b=%d",a,b);
  	a=0;									//blocking assignmnet to a

    #0 b=33;							//blocking assignmnet to b
    $display("d1 a=%d b=%d",a,b);
    a<=22;								//non-blocking assignmnet to a
    $strobe("s1 a=%d b=%d",a,b);
    b=123;								//blocking assignmnet to b
    b<=90;								//non-blocking assignmnet to b

    #10										//10 timestamp
    a<=66;								//non-blocking assignmnet to a
    a=b;									//blocking assignmnet to a
    b<=45;								//non-blocking assignmnet to b
    $display("d2 a=%d b=%d",a,b)

    #0 a=456;							//blocking assignmnet to a
    a<=33;								//non-blocking assignmnet to a
    $strobe("s2 a=%d b=%d",a,b);
    b=20;									//blocking assignmnet to b

    #5 										//15 timestamp
		a<=a;									//non-blocking assignmnet to a
    a=a+b;								//blocking assignmnet to a with expression on RHS
    b<=10;								//non-blocking assignmnet to b
    $display("d3 a=%d b=%d",a,b);	

  end
    
  
endmodule
