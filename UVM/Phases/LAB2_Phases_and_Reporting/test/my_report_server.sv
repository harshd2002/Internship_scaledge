/* class my_server extends uvm_report_server;
      //`uvm_object_utils(my_server)

     // function new(string name="my_server");
       // super.new();
     // endfunction : new

    
   virtual function string compose_report_message(uvm_severity severity,
                                           string name,
										   string id,
										   string message,
										   string filename,
										   int line);
       
	   uvm_severity_type serv = uvm_severity_type'(severity);
	   // string id = report_message.get_id();
	   // uvm_severity serv = report_message.get_severity();
	   // int serv_count = report_message.get_severity_count(UVM_ERROR);
	   // int id_count = report_message.get_id_count(DRIVER);
	   
	   if (serv.name == UVM_ERROR && id == "DRIVER") begin
	     $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ HI");
          count++;
	end
   endfunction

endclass 
*/

/* class my_error_catcher extends uvm_default_report_server;
      //`uvm_object_utils(my_server)

      function new(string name="my_server");
       super.new();
      endfunction : new

    
   virtual function string compose_report_message(uvm_report_message message, string report_object_name = "");

      
	   // string id = report_message.get_id();
	   // uvm_severity serv = report_message.get_severity();
	   // int serv_count = report_message.get_severity_count(UVM_ERROR);
	   // int id_count = report_message.get_id_count(DRIVER);
	   
	   if (serv.name == UVM_ERROR && id == "DRIVER") begin
	     $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ HI");
          count++;
	end
   endfunction

endclass
*/

class my_error_catcher extends uvm_report_catcher;
  

  function new(string name="my_error_catcher");
    super.new(name);
  endfunction
  

  function action_e catch(); 
    
    /*if(get_severity() == UVM_ERROR) begin
	 if (get_id() == "ram_agent") begin
      ram_agent_cnt++;
	  report_arr[get_id()] = ram_agent_cnt;
	 end
	 if (get_id() == "DRIVER") begin
      drv_cnt++;
	  report_arr[get_id()] = drv_cnt;
	 end
	 if (get_id() == "Agent_Top") begin
      agnt_cnt++;
	  report_arr[get_id()] = agnt_cnt;
	 end*/
	 if(!report_arr.exists(get_id))
	   report_arr[get_id()] = 1;
	 else
	  report_arr[get_id()] += 1; 
	//end
	
	//if (get_severity() == UVM_ERROR && get_id() == "DRIVER")
	  //set_severity(UVM_INFO);
	
    return UNKNOWN_ACTION;
  endfunction
endclass

		 
		  
