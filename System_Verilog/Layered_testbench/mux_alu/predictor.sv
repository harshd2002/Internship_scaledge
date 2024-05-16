//predictor class

class predictor;
	//object of transaction class to store data
	transaction trans_h, exp_trans_h;
	//mailbox to get data from monitor
	mailbox #(transaction) mon_pred_scrbd;
	//mailbox to pass data to scoreboard
	mailbox #(transaction) pred_scrbd;

	//connecting mailbox
	function void connect(mailbox #(transaction) mon_pred_scrbd, pred_scrbd);
		this.mon_pred_scrbd = mon_pred_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

	//converting pin level to transaction level
	task run();
    forever begin
		  //getting inputs
		  mon_pred_scrbd.peek(trans_h);
		  //shallow copy of object from monitor
		  exp_trans_h = new trans_h;

		  //reference model logic
      fork
      begin @(reset_evt)
        exp_trans_h.out = 0;
      end
      if(exp_trans_h.enb) begin
		    case(exp_trans_h.ops_e)
		    	0: begin
		    		 exp_trans_h.out = exp_trans_h.A & exp_trans_h.B;
		    	end
		    	1: begin
		    		 exp_trans_h.out = exp_trans_h.A - exp_trans_h.B;
		    	end
		    	2: begin
		    		 exp_trans_h.out = exp_trans_h.A + exp_trans_h.B;
		    	end
		    	3: begin
		    		 exp_trans_h.out = exp_trans_h.A * exp_trans_h.A;
		    	end
		    	4: begin
		    		 exp_trans_h.out = exp_trans_h.B * exp_trans_h.B;
		    	end
		    	5: begin
		    		 exp_trans_h.out = 'hFFFF & exp_trans_h.A;
		    	end
		    	6: begin
             exp_trans_h.out = 'h0000 & exp_trans_h.B;
		    	end
          default: begin
            exp_trans_h.out = 'h0000;
          end
		    endcase
		  end
      join_any
      disable fork;
		  //passing expected data to scoreboard
		  pred_scrbd.put(exp_trans_h);
      trans_h.print_trans("predictor");
    end
	endtask
endclass
