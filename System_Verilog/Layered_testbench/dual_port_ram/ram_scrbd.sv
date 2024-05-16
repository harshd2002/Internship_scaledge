////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: ram_scrbd.sv
//description: scoreboard class
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM scoreboard class

`ifndef RAM_SCOREBOARD
`define RAM_SCOREBOARD

class mem_scrbd;
	//handle for expected and actual data
	mem_trans exp_trans_h, act_trans_h;
	//mailbox from monitor and predictor
	mailbox #(mem_trans) mon_scrbd;
	mailbox #(mem_trans) pred_scrbd;

	//connecting mailbox
	function connect(mailbox #(mem_trans) mon_scrbd, pred_scrbd);
		this.mon_scrbd = mon_scrbd;
		this.pred_scrbd = pred_scrbd;
	endfunction

//functional coverage
//-------------------------------------------------------------
  covergroup cvg with function sample();
    RD_ADRR : coverpoint act_trans_h.rd_addr{
     bins LOW_ADDR = {[1:50]};
     bins MED_ADDR = {[51:150]};
     bins HIGH_ADDR = {[151:254]};
     bins MAX_MIN[] ={255,0};
    }

    WR_ADRR : coverpoint act_trans_h.wr_addr{
     bins LOW_ADDR = {[1:50]};
     bins MED_ADDR = {[51:150]};
     bins HIGH_ADDR = {[151:254]};
     bins MAX_MIN[] ={255,0};
    }
    WR_DATA : coverpoint act_trans_h.wr_data{
     bins LOW_DATA = {[1:85]};
     bins MED_DATA = {[86:170]};
     bins HIGH_DATA = {[171:255]};
    }
    RD_DATA : coverpoint act_trans_h.rd_data{
     bins LOW_DATA = {[1:85]};
     bins MED_DATA = {[86:170]};
     bins HIGH_DATA = {[171:255]};
    }


    RD_DATA0 : coverpoint act_trans_h.rd_data[0]{
     bins TRAN[] = (1=>0,0=>1);
    }
    
    RD_DATA1 : coverpoint act_trans_h.rd_data[1]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA2 : coverpoint act_trans_h.rd_data[2]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA3 : coverpoint act_trans_h.rd_data[3]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA4 : coverpoint act_trans_h.rd_data[4]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA5 : coverpoint act_trans_h.rd_data[5]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA6 : coverpoint act_trans_h.rd_data[6]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA7 : coverpoint act_trans_h.rd_data[7]{
      bins TRAN[] = (1=>0,0=>1);
    }
    B2B : coverpoint act_trans_h.ops_e{
      bins B2B[] = {WRITE->READ->WRITE->READ};
    }
    RD_EN : coverpoint act_trans_h.ops_e{
      bins RD = {READ};
    }
    WR_EN : coverpoint act_trans_h.ops_e{
      bins WR = {WRITE};
    }

    CRW : cross WR_EN,WR_ADRR,WR_DATA;
    CRR : cross RD_EN,RD_ADRR,RD_DATA;
  endgroup
function new();
  cvg=new();
endfunction

//-------------------------------------------------------------
	//comparing outputs
	task run();
    forever begin
		mon_scrbd.get(act_trans_h);
		pred_scrbd.get(exp_trans_h);
    cvg.sample();
    //$display($time, "scoreboard");
		$display($time," : scoreboard expected: %0p", exp_trans_h);
    exp_trans_h.print_trans("scoreboard");
		$display($time," : scoreboard actual: %0p", act_trans_h);
    act_trans_h.print_trans("scoreboard");
		//scoreboard logic 
		//if(act_trans_h.rd_enbl || act_trans_h.wr_enbl)
			wait(exp_trans_h.rd_data == act_trans_h.rd_data)
				$display($time," :read pass");
			//else
				//$display($time, " :read fail");
    end
	endtask

endclass
`endif
