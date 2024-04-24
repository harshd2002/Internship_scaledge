module file_ops();
	
  reg [7:0] arr1 [0:2][0:15];
  reg [7:0] arr2 [0:15][0:2];
	integer fd, fread1, fread2;
  
  integer i;

	initial begin

      $readmemh("datah.txt", arr1);
      $readmemb("datab.txt", arr2);

      for(i=0;i<16;i=i+1) 
        $display("arr1 : %d = %d %d %d", i, arr1[0][i], arr1[1][i], arr1[2][i]);
      for(i=0;i<16;i=i+1) 
        $display("arr2 : %d = %d %d %d", i, arr2[i][0], arr2[i][1], arr2[i][2]);

			fd = $fopen("mem.txt", "w");

      for(i=0;i<16;i=i+1) 
				$fdisplay(fd,	"%2d", i, i);

			$fclose(fd);

			fd = $fopen("mem.txt", "r");

      for(i=0;i<16;i=i+1) begin 
				$fscanf(fd,"%2d %2d",	fread1, fread2);
				$display("read %d = %2d\t%2d ", i, fread1, fread2);
			end

			$fclose(fd);
      
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
