
module top;

    `include "uvm_macros.svh"
  	import uvm_pkg::*;
	
    //lab pkg
     import pkg::*;
	 
    trans transh,transh_copy, transh_clone;

	initial begin
      transh=trans::type_id::create("transh");
      void'(transh.randomize());
	  //$display("transh = %p",transh);
      transh.print(uvm_default_table_printer);	
      transh_copy=trans::type_id::create("transh_copy");
      transh_copy.copy(transh);
	  transh_copy.print(uvm_default_tree_printer);
      //transh_copy.print();
	  //$cast(transh_clone,transh.clone());
	  //transh_clone.print();
	  //void'(transh.randomize());
	  if(transh.compare(transh_copy))
	    `uvm_info("COMAPRE","SUCCESSFUL",UVM_LOW)
      else
       `uvm_info("COMAPRE","oops ! UNSUCCESSFUL",UVM_LOW)	  
	end
		
/*
	trans transh[]; 
	
 	int no_of_trans=5;
        
 	initial
	begin

  	  transh = new[no_of_trans];  

    foreach(transh[i]) begin
	  transh[i]=trans::type_id::create($sformatf("transh[%2d]",i));
	  if(!transh[i].randomize())  $display("RANDOMIZATION FAILED!");

 	  transh[i].print(uvm_default_table_printer);
  	end	
    	
    transh[1].copy(transh[2]); // deep copy
	transh[1].print();
	
  	transh_copy=trans::type_id::create("transh_copy");
	
    transh_copy.copy(transh[6]);  //deep copy
	
 	transh_copy.print(uvm_default_tree_printer);

     // also check without "null"
    if(transh[2].compare(transh[6], null)) 
       $display("COMPARE SUCCESSFUL");
    else
       $display("COMPARE FAILURE");


  	$cast(transh_clone,transh[4].clone());
	transh_clone.print(uvm_default_tree_printer);

    	end
*/

endmodule : top

