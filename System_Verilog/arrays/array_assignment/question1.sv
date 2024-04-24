module multidim_arr();
  parameter SIZE = 8,
			WIDTH = 4,
			DEPTH = 6;
  bit [SIZE-1 : 0] mem1 [WIDTH][DEPTH];
  bit [0:DEPTH-1][SIZE-1 : 0] mem2 [WIDTH];
  
  initial begin
    foreach(mem1[i]) begin
      foreach(mem1[i][j]) begin
        mem1[i][j] = {$random}%256;
        $display("mem1[%0d][%0d] = 0x%0h", i, j, mem1[i][j]);
      end
    end
    
    //mem2 = {>>{mem1[0], mem1[1], mem1[2], mem1[3]}};
    mem2 = {>>{mem1}};
    //mem2 = {<<48{mem1[3], mem1[2], mem1[1], mem1[0]}};
    
    $display("mem2[3][3:5] = 0x%0h", mem2[3][3:5]);
  end

endmodule
