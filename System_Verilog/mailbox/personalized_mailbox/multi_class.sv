`include "class_mailbox.sv"

class trans;
	rand byte a;
	function void disp();
		$display("property a: %0d", a);
	endfunction
endclass

emailbox #(trans) mbox = new(5);
function void disp_mbx();
	$display("queue values are:");
	foreach(mbox.que[i])
		$display("values of queue : %0p", mbox.que[i]);
endfunction

class gen;
	trans trans_o;
	emailbox #(trans) mbox_g;
	function new();
		mbox_g = mbox;
	endfunction
	task put_g(trans obj);
		mbox_g.put(obj);
	endtask
	task get_g(trans obj);
		mbox_g.get(obj);
	endtask
	function void disp_g(trans obj);
		$display("gen: after get is: %0p", obj);
	endfunction
	task run();
		repeat(10) begin
			trans_o = new();
			trans_o.randomize();
			mbox_g.put(trans_o);
		 	$display($time," :size: %0d: IN GEN mbx : %p", mbox_g.num(), trans_o);
		end
	endtask: run
endclass

class driver;
	trans trans_o;
	emailbox #(trans) mbox_d;
	function new();
		mbox_d = mbox;
	endfunction
	task put_d(trans obj);
		mbox_d.put(obj);
	endtask
	task get_d(output trans obj);
		mbox_d.get(obj);
	endtask
	function void disp_d(trans obj);
		$display("driver: after get is: %0p", obj);
	endfunction
	task run();
		repeat(10) begin
			mbox_d.get(trans_o);
			$display($time," :size: %0d: IN driver mbx : %p", mbox_d.num(), trans_o);
		end
	endtask: run
endclass

module multi_mbox();
	gen obj_gen1;
	driver obj_dr1;
	//trans obj_tr1;
	initial begin
		obj_gen1 = new();
		obj_dr1 = new();
		//obj_tr1 = new();
		//obj_tr1.randomize();
		fork
			obj_gen1.run();
			obj_dr1.run();
		join
		$display("completed");
	end
endmodule
