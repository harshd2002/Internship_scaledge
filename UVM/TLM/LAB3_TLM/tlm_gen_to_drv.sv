//------------------TLM GENERATOR TO DRIVER-----------------------//

module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;

  rand bit[7 : 0] data;    
	rand bit[3 : 0] address;
	rand bit write;

endclass:trans

class gen extends uvm_component;

  trans trans_h;

  `uvm_component_utils(gen)
  
  uvm_blocking_put_port #(trans) put_port; 
  uvm_blocking_get_imp #(trans, gen) get_imp;
  uvm_blocking_peek_imp #(trans, gen) peek_imp;
 
  function new(string name="gen",uvm_component parent);
    super.new(name,parent);
    put_port=new("put_port",this);
    get_imp = new("get_imp", this);
    peek_imp = new("peek_imp", this);
  endfunction 

  //function for get task
/*
  function void get(output trans trans_h);
    trans_h=new();
    assert(trans_h.randomize());
    `uvm_info("GEN",$sformatf("get trans_h = %p",trans_h),UVM_MEDIUM)
  endfunction
*/  

  task get(output trans trans_h);
//  trans_h=new();
//  assert(trans_h.randomize());
    trans_h = this.trans_h;
    `uvm_info("GENERATOR",$sformatf("get trans_h = %p",trans_h),UVM_MEDIUM)
  endtask

  //function for performing peek
  /*
  function void peek(output trans trans_h); 
    trans_h = new();
    assert(trans_h.randomize());
    `uvm_info("GENERATOR",$sformatf("peek trans_h = %p",trans_h),UVM_MEDIUM)
  endfunction
  */

  task peek(output trans trans_h); 
    #2;
    trans_h = new();
    assert(trans_h.randomize());
    this.trans_h = trans_h;
    `uvm_info("GENERATOR",$sformatf("peek trans_h = %p",trans_h),UVM_MEDIUM)
  endtask
  
  task run_phase(uvm_phase phase);
    repeat(10) begin
      trans_h=new();
      assert(trans_h.randomize());
    //  `uvm_info("GEN",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
    //  put_port.put(trans_h);
    end
  endtask

endclass
	
class driver extends uvm_component;
 
    trans trans_h;

   `uvm_component_utils(driver)
   
    uvm_blocking_put_imp #(trans,driver) put_imp;
    uvm_blocking_get_port #(trans) get_port;
    uvm_blocking_peek_port #(trans) peek_port;
 
    function new(string name="driver",uvm_component parent);
	  super.new(name,parent);
	  put_imp=new("put_imp",this); 
    get_port = new("get_port", this);
    peek_port = new("peek_imp", this);
	endfunction
	
	task put (trans trans_h);
	  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	endtask

  task run_phase(uvm_phase phase);
    repeat(10) begin
      peek_port.peek(trans_h);
	    `uvm_info("DRIVER",$sformatf("peek trans_h = %p",trans_h),UVM_MEDIUM)
      get_port.get(trans_h);
	    `uvm_info("DRIVER",$sformatf("get trans_h = %p",trans_h),UVM_MEDIUM)
    end
  endtask
	
endclass

class agent extends uvm_component;

  // Factory Registration
  `uvm_component_utils(agent)

  // declare the Driver handle
  driver drvh;
  gen gen_h;

  function new(string name="agent",uvm_component parent);
  	super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);	
  	drvh=driver::type_id::create("drvh",this);
  	gen_h=gen::type_id::create("gen_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
  	gen_h.put_port.connect(drvh.put_imp);
    drvh.get_port.connect(gen_h.get_imp);
    drvh.peek_port.connect(gen_h.peek_imp);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #50;
    phase.drop_objection(this);
  endtask
	
endclass

initial begin
  run_test("agent");
end
	
endmodule
	
