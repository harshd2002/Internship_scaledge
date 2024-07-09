

  class trans extends uvm_sequence_item;

	rand bit enb;
	rand bit[7 : 0] data;    
	rand bit[3 : 0] address;             

    //TODO : explore all flags and settings 
	`uvm_object_utils_begin(trans)
	  `uvm_field_int(enb,UVM_ALL_ON)
	  `uvm_field_int(data,UVM_ALL_ON | UVM_NOCOPY)
	  `uvm_field_int(address,UVM_ALL_ON | UVM_DEC)
	`uvm_object_utils_end  



extern function new(string name = "trans");

endclass:trans


	function trans::new(string name = "trans");
		super.new(name);
	endfunction:new

 
   
 
