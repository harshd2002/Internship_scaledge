//testbench 

module tb();

	parameter WIDTH = 8,
			DEPTH = 16,
        	SIZE = $clog2(DEPTH),
			DIFFERENCE = 2;
	
	reg wclk, rclk, wrstn, rrstn, wen, ren;
	reg [WIDTH-1'b1 : 0] wdata;
	wire [WIDTH-1'b1 : 0] act_rdata;
	wire act_full, act_empty, act_almost_full, act_almost_emp;
	
	async_fifo #(.WIDTH(WIDTH),
				.DEPTH(DEPTH),
				.SIZE(SIZE),
				.DIFF(DIFFERENCE))
				dut(.wr_clk(wclk),
					.rd_clk(rclk),
					.wr_rstn(wrstn),
					.rd_rstn(rrstn),
					.wr_en(wen),
					.rd_en(ren),
					.wr_data(wdata),
					.rd_data(act_rdata),
					.full(act_full),
					.empty(act_empty),
					.almost_full(act_almost_full),
					.almost_empty(act_almost_empty)
				);

	task wr_resetn();
	begin
		@(negedge wclk);
		wrstn = 1'b0;
		wen = 1'b0;
		wdata = 'd0;
		@(posedge wclk);
		wrstn = 1'b1;
	end
	endtask

	task rd_resetn();
	begin
		@(negedge rclk);
		rrstn = 1'b0;
		ren = 1'b0;
		@(posedge rclk);
		rrstn = 1'b1;
	end
	endtask

	task write(input reg [WIDTH-1'b1 : 0] data);
		begin
			@(negedge wclk);
			wdata = data;
			wen = 1'b1;
		end
	endtask

	task read();
		begin
			@(negedge rclk);
			ren = 1'b1;
		end
	endtask

	task wr_clock_delay(input integer del);
		repeat(del) @(posedge wclk);
	endtask

	task rd_clock_delay(input integer del);
		repeat(del) @(posedge rclk);
	endtask

	initial begin
		fork
		wr_resetn();
		rd_resetn();
		join
			@(negedge rclk);
			ren = 1'b0;
			wen = 1'b0;

//sanity check
		if($test$plusargs("sanity_test")) begin
		write(23);
		write(56);
			@(negedge rclk);
			wen = 1'b0;
		read();
		read();
			@(negedge rclk);
			ren = 1'b0;
		end

//full flag check by completely writing the fifo
		if($test$plusargs("fifo_full")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		end

//full flag check by half writing the fifo
		if($test$plusargs("fifo_half_full")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH/2) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		repeat(DEPTH/2) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		end

//empty flag check
		if($test$plusargs("fifo_empty")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		end

//simultaneous read write when fifo is about to get full to see if it hangs or not
		if($test$plusargs("simultaneous_rw")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH - 2'd2) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(5) fork
			write({$random});
			read();
		join
			@(negedge rclk);
			ren = 1'b0;
			wen = 1'b0;
		end

//continuous read write when fifo is almost full to check if fifo hangs or not
		if($test$plusargs("continuous_rw")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH - 2'd2) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(5) begin
			write({$random});
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
			wen = 1'b0;
		end

//checking overflow flag
		if($test$plusargs("overflow_check")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH + 2'd2) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		end

//checking overflow flag
		if($test$plusargs("underflow_check")) begin
		fork
		wr_resetn();
		rd_resetn();
		join
		repeat(DEPTH) begin
			write({$random});
		end
			@(negedge rclk);
			wen = 1'b0;
		repeat(DEPTH + 2'd2) begin
			read();
		end
			@(negedge rclk);
			ren = 1'b0;
		end

		#50;
		$finish;

	end

	initial begin
		wclk = 1'b0;
		forever #10 wclk = ~wclk;
	end

	initial begin
		rclk = 1'b0;
		forever #20 rclk = ~rclk;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

//reference model for self checking
  reg [WIDTH-1'b1:0] ref_mem [0 : DEPTH-1'b1];
  reg [WIDTH-1'b1 : 0] exp_rd_data, wr_1, wr_2, rd_1, rd_2;
  reg exp_full, exp_empty, exp_almost_full, exp_almost_empty;
	reg exp_overflow, exp_underflow;
  reg [SIZE-1'b1 : 0] wr_ptr, rd_ptr;
	reg wr_wrap, rd_wrap;
	
	always @(posedge wclk or negedge wrstn) begin
		if(!wrstn) begin
			wr_ptr <= 'd0;
			exp_full <= 1'b0;
			exp_almost_full <= 1'b0;
			wr_wrap = 1'b0;
		end
		else if(wen && !exp_full) begin
			ref_mem[wr_ptr[SIZE-1'b1 : 0]] <= wdata;
			wr_ptr <= wr_ptr + 1'b1;
			if(wr_ptr == (DEPTH-1'b1))
			wr_wrap = ~wr_wrap;
		end
	end

	always @(posedge rclk or negedge rrstn) begin
		if(!rrstn) begin
			rd_ptr <= 'd0;
			exp_empty <= 1'b1;
			exp_rd_data <= 'd0;
			exp_almost_empty <= 1'b0;
			rd_wrap = 1'b0;
		end
		else if(ren && !exp_empty) begin
			exp_rd_data <= ref_mem[rd_ptr[SIZE-1'b1 : 0]] ;
			rd_ptr <= rd_ptr + 1'b1;
			if(rd_ptr == (DEPTH-1'b1))
			rd_wrap = ~rd_wrap;
		end
	end

	always @(posedge wclk or negedge wrstn) begin
		if(!wrstn) begin
			rd_1 <= 'd0;
			rd_2 <= 'd0;
		end
		else begin	
			rd_2 <= rd_ptr;
			rd_1 <= rd_2;
		end
	end

	always @(posedge rclk or negedge rrstn) begin
		if(!rrstn) begin
			wr_1 <= 'd0;
			wr_2 <= 'd0;
		end
		else begin	
			wr_2 <= wr_ptr;
			wr_1 <= wr_2;
		end
	end

	always @(wr_ptr or rd_1) begin
		if((wr_wrap != rd_wrap) && (wr_ptr == rd_1)) begin
			exp_full = 1'b1;
		end
		else begin
			exp_full = 1'b0;
		end

		if(wr_wrap != rd_wrap) begin
			if(((rd_1 - wr_ptr) <= DIFFERENCE) && (!exp_full))
				exp_almost_full = 1'b1;
			else
				exp_almost_full = 1'b0;
		end
		else begin
			if(((wr_ptr - rd_1) >= (DEPTH - DIFFERENCE)) && (!exp_full))
				exp_almost_full = 1'b1;
			else
				exp_almost_full = 1'b0;
		end

	end

	always @(rd_ptr or wr_1) begin
		if((rd_ptr == wr_1) && (wr_wrap == rd_wrap)) begin
			exp_empty = 1'b1;
		end
		else begin
			exp_empty = 1'b0;
		end

		if(wr_wrap != rd_wrap) begin
			if(((rd_ptr - wr_1) >= (DEPTH-DIFFERENCE)) && !exp_empty)
				exp_almost_empty = 1'b1;
			else
				exp_almost_empty = 1'b0;
		end
		else begin
			if(((wr_1 - rd_ptr) <= DIFFERENCE) && !exp_empty)
				exp_almost_empty = 1'b1;
			else
				exp_almost_empty = 1'b0;
		end
	end

//checker for selfchecking
	initial begin

		forever @(exp_rd_data, act_rdata) begin
		#1;								//delay in order to get stable values so that can be compared properly
			$display("--------------------------------------------------------------------");
				$display($time," :read pointer = %d,write pointer = %d ",rd_ptr, wr_ptr);
			if(exp_rd_data == act_rdata) begin
				$display($time," :read data is passed");
				$display($time," :actual read = %d, expected read = %d ",act_rdata, exp_rd_data);
			end
			else begin
				$display($time," :read data is failed ");
				$display($time," :actual read = %d, expected read = %d ",act_rdata, exp_rd_data);
			end

			if(exp_full == act_full) begin
				$display($time," :full flag is passed");
			end
			else begin
				$display($time," :full flag is failed ");
			end
			
			if(exp_empty == act_empty) begin
				$display($time," :empty flag is passed");
			end
			else begin
				$display($time," :empty flag is failed ");
			end
			
			if(exp_almost_full == act_almost_full) begin
				$display($time," :almost full is passed");
			end
			else begin
				$display($time," :almost full is failed ");
			end
			if(exp_almost_empty == act_almost_empty) begin
				$display($time," :almost empty is passed");
			end
			else begin
				$display($time," :almost empty is failed ");
			end
			$display("--------------------------------------------------------------------");

		end


	end
endmodule
