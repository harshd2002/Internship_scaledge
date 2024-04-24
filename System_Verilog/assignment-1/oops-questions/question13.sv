class parent;
  function void xyz();
 	  $display("Parent Method");
 	endfunction
endlass

class child extends parent;
	function void xyz();
 		$display("Child Method");
 	endfunction
endclass

module inheritance();
	initial begin
		parent p_h;
		child c_h
	  p_h = new();
 	  c_h = new();
	  p_h.xyz();
 	  c_h.xyz();
	  p_h = c_h;
	  p_h.xyz();
	end
endmodule
