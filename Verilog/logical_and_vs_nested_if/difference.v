module difference;
  reg a;
  reg b;
  reg c;
  initial begin
    a = 1;
    b = 0;

    if((a==0) && (c = (b==1) ?1:0 )) begin
      $display(" logical and && ");
    end
    if(a==1) begin
      $display(" nested if 1st ");
      if(b==1) begin
        $display(" nested if 2nd ");
       end
    end
    $display(" %d ",c);
 
  end
endmodule
