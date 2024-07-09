//Example on hierarchical components and fifo in TLM

`include "uvm_macros.svh"

module tlm_fifo_in_hierarchy();
  import uvm_pkg::*;
  
  class trans;
  
    rand bit[7 : 0] data;    
  	rand bit[3 : 0] address;
  	rand bit write;
  
  endclass:trans
  
  class stim extends uvm_component;
    //transaction class handle
    trans trans_h;

    //registering the class
    `uvm_component_utils(stim)

    //declaring blocking put port instantiation
    uvm_blocking_put_port #(trans) put_port;

    //new function
    function new(string name = "STIM", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      put_port = new("put_port", this);
    endfunction

    task run_phase(uvm_phase phase);
      repeat(20) begin
      trans_h = new();
      assert(trans_h.randomize());
      `uvm_info("STIM", $sformatf("[BLOCKING PUT] trans_h = %0p", trans_h), UVM_LOW);
      put_port.put(trans_h);
      end
    endtask
  endclass

  class conv extends uvm_component;
    //transaction class handle
    trans trans_h;

    //registering the class
    `uvm_component_utils(conv)

    //declaring blocking get port to get data from fifo
    uvm_blocking_get_port #(trans) get_port;

    //declaring blocking put port to pass data to consumer
    uvm_blocking_put_port #(trans) put_port;

    function new(string name = "CONV", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      get_port = new("get_port", this);
      put_port = new("put_port", this);
    endfunction

    task run_phase(uvm_phase phase);
      forever begin
        fork
        get_port.get(trans_h);
        //`uvm_info("CONV", $sformatf(" trans_h = %0p", trans_h), UVM_LOW);
        put_port.put(trans_h);
      join
      end
    endtask
  endclass

  class producer extends uvm_component;

    //Factory Registration
    `uvm_component_utils(producer);

    //sub-class handles
    stim stim_h;
    conv conv_h;
    
    //blocking put port to pass data from producer to consumer
    uvm_blocking_put_port #(trans) put_port;

    //FIFO declaration
    uvm_tlm_fifo #(trans) prod_fifo_h;

    function new(string name = "GEN", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      stim_h       = new("stim_h", this);
      conv_h       = new("conv_h", this);
      prod_fifo_h = new("prod_fifo_h", this, 1);
      put_port = new("put_port", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      stim_h.put_port.connect(prod_fifo_h.put_export);
      conv_h.get_port.connect(prod_fifo_h.get_export);
      conv_h.put_port.connect(put_port);
    endfunction
  endclass

  class drive extends uvm_component;

    //trans class handle
    trans trans_h;

    //Factory Registration
    `uvm_component_utils(drive);

    //blocking get port declaration
    uvm_blocking_get_port #(trans) get_port;

    function new(string name = "DRIVE", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      get_port = new("get_port", this);
    endfunction

    task run_phase(uvm_phase phase);
      forever begin
        get_port.get(trans_h);
        `uvm_info("DRIVE", $sformatf("[BLOCKING GET] trans_h = %0p", trans_h), UVM_LOW);
      end
    endtask
  endclass

  class consumer extends uvm_component;

    //Factory Registration
    `uvm_component_utils(consumer);

    //sub-class handles
    drive drv_h;

    //FIFO declaration
    uvm_tlm_fifo #(trans) drive_fifo_h;
    
    //blocking put port to pass data from producer to consumer
    uvm_blocking_put_export #(trans) put_export;

    function new(string name = "GEN", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      drv_h        = new("drv_h", this);
      drive_fifo_h = new("drive_fifo_h", this, 1);
      put_export   = new("put_export", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      put_export.connect(drive_fifo_h.put_export);
      drv_h.get_port.connect(drive_fifo_h.get_export);
    endfunction
  endclass

  class agent extends uvm_component;

    //Factory Registration
    `uvm_component_utils(agent)

    //Declaring handles
    producer prod_h;
    consumer cons_h;

    function new(string name = "AGENT", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      prod_h = producer::type_id::create("prod_h", this);
      cons_h = consumer::type_id::create("cons_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      prod_h.put_port.connect(cons_h.put_export);
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
