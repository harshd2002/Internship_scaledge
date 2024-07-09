///////////// TLM Example With Config /////////////////////////

module tlm_example_with_config();

  import uvm_pkg::*;
 
  `include "uvm_macros.svh"

  //driver class
class driver extends uvm_driver;
  
  int b;

  //Factory Registration
  `uvm_component_utils(driver)

  function new (string name="driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);  
    if (!uvm_config_db #(int)::get(this,"","a",b))
	    `uvm_error(get_full_name(), "Can't get data from config db")
    $display("Build_phase_driver");
    $display("value of b = %0d",b);
  endfunction:build_phase
  
  function void connect_phase(uvm_phase phase);
    $display("Connect_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    $display("end_of_elaboration_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    $display("start_of_simulation_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void extract_phase(uvm_phase phase);
    $display("extract_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void checker_phase(uvm_phase phase);
    $display("checker_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void report_phase(uvm_phase phase);
    $display("report_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
  function void final_phase(uvm_phase phase);
    $display("final_phase_driver");
    $display("value of b = %0d",b);
  endfunction
  
endclass:driver


class agent extends  uvm_agent;


  //factory registration
  `uvm_component_utils(agent)
 
  //creat the driver handle
  driver drv_h;

  int a;
 
  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
  endfunction
   
  function void build_phase(uvm_phase phase);
    drv_h= driver::type_id::create("drv_h",this);
	  uvm_config_db #(int)::set(this,"*","a",5);
	  $display("value of a=%0d",a);
    factory.print();
    uvm_top.print_topology();
  endfunction:build_phase
  
  task run_phase(uvm_phase phase);
	uvm_test_done.raise_objection(this);
	#50;
	uvm_test_done.drop_objection(this);
  endtask:run_phase
  
  function void connect_phase(uvm_phase phase);
    $display("Connect_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    $display("end_of_elaboration_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    $display("start_of_simulation_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void extract_phase(uvm_phase phase);
    $display("extract_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void checker_phase(uvm_phase phase);
    $display("checker_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void report_phase(uvm_phase phase);
    $display("report_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
  function void final_phase(uvm_phase phase);
    $display("final_phase_agent");
    $display("value of a = %0d",a);
  endfunction
  
 
endclass:agent
 
 initial begin
  run_test("agent");
 end
	
endmodule
   
   
   
  
  
  
 


  
  
  
	
 
 
  
