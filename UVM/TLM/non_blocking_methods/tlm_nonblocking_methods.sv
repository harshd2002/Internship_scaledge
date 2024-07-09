//Example on non-blocking methods of TLM

`include "uvm_macros.svh"

module tlm_nonblocking();
  import uvm_pkg::*;
  
  class trans;
  
    rand bit[7 : 0] data;    
  	rand bit[3 : 0] address;
  	rand bit write;
  
  endclass:trans
  
  class producer extends uvm_component;
    //transaction class handle
    trans trans_h;

    //registering the class
    `uvm_component_utils(producer)

    //declaring non-blocking put port instantiation
    //uvm_put_port #(trans) try_put_port;
    uvm_nonblocking_put_port #(trans) try_put_port;

    //new function
    function new(string name = "PRODUCER", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      try_put_port = new("try_put_port", this);
    endfunction

    task run_phase(uvm_phase phase);
      repeat(5) begin
      trans_h = new();
      assert(trans_h.randomize());
      `uvm_info("PRODUCER_GEN", $sformatf("[TRY_PUT] trans_h = %0p", trans_h), UVM_LOW);
      //try_put_port.try_put(trans_h);
      try_put_port.try_put(trans_h);
      end
    endtask
  endclass

  class target extends uvm_component;
    //transaction class handle
    trans trans_h;

    //registering the class
    `uvm_component_utils(target)

    //declaring non-blocking put port instantiation
    //uvm_put_imp #(trans, target) try_put_imp;
    uvm_nonblocking_put_imp #(trans, target) try_put_imp;

    function new(string name = "TARGET", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      try_put_imp = new("try_put_imp", this);
    endfunction

    //function put
    function bit put(trans trans_h);
      this.trans_h = trans_h;
      `uvm_info("TARGET_DRV", $sformatf("[TRY_PUT] trans_h = %0p", trans_h), UVM_LOW);
    endfunction

    //function try_put
    function bit try_put(trans trans_h);
      this.trans_h = trans_h;
      `uvm_info("TARGET_DRV", $sformatf("[TRY_PUT] trans_h = %0p", trans_h), UVM_LOW);
    endfunction

    //function can_put
    function bit can_put();
    endfunction

  endclass

  class generator extends uvm_component;

    //Factory Registration
    `uvm_component_utils(generator);

    //producer class handle
    producer prod_h;
    
    //put port declaration
    //uvm_put_port #(trans) try_put_port;
    uvm_nonblocking_put_port #(trans) try_put_port;

    function new(string name = "GEN", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      prod_h       = new("prod_h", this);
      try_put_port = new("try_put_imp", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      prod_h.try_put_port.connect(try_put_port);
    endfunction
  endclass

  class driver extends uvm_component;

    //Factory Registration
    `uvm_component_utils(driver);

    //target class handle
    target trg_h;
    
    //put port declaration
    //uvm_put_port #(trans) try_put_port;
    uvm_nonblocking_put_export #(trans) try_put_export;

    function new(string name = "GEN", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      trg_h  = new("prod_h", this);
      try_put_export = new("try_put_export", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      try_put_export.connect(trg_h.try_put_imp);
    endfunction
  endclass

  class agent extends uvm_component;

    //Factory Registration
    `uvm_component_utils(agent)

    //Declaring handles
    generator gen_h;
    driver drv_h;

    function new(string name = "AGENT", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      gen_h = generator::type_id::create("gen_h", this);
      drv_h = driver::type_id::create("drv_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      gen_h.try_put_port.connect(drv_h.try_put_export);
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
