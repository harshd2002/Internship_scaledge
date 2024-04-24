//testbench - round robin arbiter
//testinputs:
//1. Initial reset and reset on the fly.
//2. sanity - individual requests.
//3. checking for multile requests.
//4. checking every transition for the fsm

module tb;

	parameter REQS = 4;

	reg clk, rst;
	reg [REQS-1'b1 : 0] req;
	wire [REQS - 1'b1 : 0] act_grant;

	rra #(.REQS(REQS)) dut(.clk(clk), .rst(rst), .req(req), .grant(act_grant));

	task reset(input integer del);
	begin
		@(negedge clk)
		rst = 1'b0;
      	req = 4'b0;
		repeat(del) @(negedge clk);
		rst = 1'b1;
	end
	endtask

	task request(input [REQS - 1'b1 : 0] request);
	begin
		@(negedge clk)
		req = request;
	end
	endtask

	initial begin
      
		//initial reset
      	reset(1);

		//sanity - generating individual requests
		if($test$plusargs("sanity")) begin
			request(1);
			request(2);
			request(4);
			request(8);
			request(0);
			repeat(2) @(negedge clk);
		end

		//priority check when all requests arrive together and it will implement all requests one by one 
		if($test$plusargs("priority_check")) begin
      	reset(1);
		request(15);
      	repeat(8) @(negedge clk);
		request(14);
      	repeat(8) @(negedge clk);
		request(12);
      	repeat(8) @(negedge clk);
		request(8);
      	repeat(8) @(negedge clk);
		request(0);
      	repeat(4) @(negedge clk);
		end

//FSM transition check

		//Transitions from s0
		if($test$plusargs("ideal_transition")) begin
      	reset(1);
		request(1);
		request(0);
		request(2);
		request(0);
		request(4);
		request(0);
		request(8);
		request(0);
      	repeat(2) @(negedge clk);
		end

		//Transitions from s1
		if($test$plusargs("s1_transition")) begin
      	reset(1);
		request(1);
		request(0);
		request(3);
      	repeat(2) @(negedge clk);
		request(5);
      	repeat(1) @(negedge clk);
		request(9);
		request(1);
      	repeat(1) @(negedge clk);
		end

		//Transitions from s2
		if($test$plusargs("s2_transition")) begin
      	reset(1);
		request(2);
		request(0);
		request(2);
		request(3);
		request(6);
		request(10);
		request(2);
      	repeat(2) @(negedge clk);
		end

		//Transitions from s3
		if($test$plusargs("s3_transition")) begin
      	reset(1);
		request(4);
		request(0);
		request(4);
		request(5);
		request(4);
		request(6);
		request(12);
      	repeat(1) @(negedge clk);
		request(4);
      	repeat(2) @(negedge clk);
		end

		//Transitions from s4
		if($test$plusargs("s4_transition")) begin
      	reset(1);
		request(8);
		request(0);
		request(8);
		request(9);
		request(8);
		request(10);
		request(8);
		request(12);
		request(8);
      	repeat(2) @(negedge clk);
		end

		//inbetween reset (reset on the fly)
		if($test$plusargs("inbetween_reset")) begin
      	reset(1);
		request(13);
      	repeat(5) @(negedge clk);
		request(0);
      	repeat(2) @(negedge clk);
		end

      	repeat(5) @(negedge clk);
		$stop;
	end

	initial begin
	       clk = 1'b0;
       	   forever #5 clk = ~clk;
    end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

//reference model for self checking
	reg [REQS-1'b1:0] exp_grant, gnt, flag;

	always @(posedge clk or negedge rst) begin
		exp_grant <= gnt;
		if(!rst) begin
			exp_grant <= 4'h0;
			gnt <= 4'h0;
			flag <=4'h0;
		end
		else begin
		if(req[0] && !flag[0]) begin
			gnt <= 4'h1;
			flag <= 4'h1;
			if(req[REQS-1'b1:1] == 0) 
				flag <= 4'h0;
		end
		else if(req[1] && !flag[1]) begin
			gnt <= 4'h2;
			flag <= 4'h3;
			if(req[REQS-1'b1:2] == 0) 
				flag <= 4'h0;
		end
		else if(req[2] && !flag[2]) begin
			gnt <= 4'h4;
			flag <= 4'h7;
			if(req[3] == 0) 
				flag <= 4'h0;
		end
		else if(req[3] && !flag[3]) begin
			gnt <= 4'h8;
			flag <= 4'h0;
		end
		else begin
			gnt <= 4'h0;
			flag <= 4'h0;
		end
		end
	end

//checker
	initial begin
		forever @(exp_grant or act_grant) begin
		#1;					//due to delta simulation gap, signals may differ while comparing. So delay of 1 was given to get stable signals

		$display("--------------------------------------------------------------");
		$display($time," :request = %b, actual grant = %b, expected grant = %b", req, act_grant, exp_grant);
			if(exp_grant == act_grant)
				$display($time," :grant is passed.");
			else
				$display($time," :grant is not passed.");
		$display("--------------------------------------------------------------");
		end
	end

endmodule 
