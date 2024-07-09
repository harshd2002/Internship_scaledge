

  class trans extends uvm_sequence_item;
  
    	`uvm_object_utils(trans)

	rand bit enb;
	rand bit[7 : 0] data;    
	rand bit[3 : 0] address;
  
         
extern function new(string name);
extern function void do_copy(uvm_object rhs);
extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
extern function void do_print(uvm_printer printer);

endclass:trans


	function trans::new(string name);
		super.new(name);
	endfunction:new
	  
  function void trans::do_copy (uvm_object rhs);

    trans transh;

    if(!$cast(transh,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs failed")
    end
    super.do_copy(rhs);

    enb= transh.enb;
    data= transh.data;
    address= transh.address;

  endfunction:do_copy


  function bit  trans::do_compare (uvm_object rhs,uvm_comparer comparer);

    trans transh;

    if(!$cast(transh,rhs)) begin
    `uvm_fatal("do_compare","cast of the rhs object failed")
    return 0;
    end


    return super.do_compare(rhs,comparer) &&
    data== transh.data &&
    address== transh.address &&
    enb== transh.enb;

 endfunction:do_compare 

   //printer.print_field for integral properties
   function void  trans::do_print (uvm_printer printer);
    super.do_print(printer);   
    //                   srting name   		bitstream value     size       radix for printing
    printer.print_field( "enb", 		    this.enb, 	        '1,		 UVM_BIN);
	printer.print_field( "data", 		    this.data, 	        '64,	 UVM_DEC);
    printer.print_field( "address", 		this.address, 	    '12,     UVM_DEC);


  endfunction:do_print
    
   

