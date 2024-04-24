module random_seed();
  
  integer i,k=1,j=2;
  
  initial begin
    
    for(i=0;i<10;i=i+1) begin
      $display("seed = 1: %0d, seed = 2: %0d",{$random(k)}, {$random(j)});
      #1;
    end
    
  end
  
endmodule
  
  
  
  
  
  
  
  
  
  
  
  
  
  
