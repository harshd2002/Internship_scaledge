//--------------mailbox class----------------

class emailbox #(type T = int);
	T que[$];
	local int unsigned size;
	function new(input int size = 0);
		if(size < 0)
			$error("enter a positive number");
		this.size = size;
		
	endfunction
	extern task put(input T msge);
	extern task get(output T msge);
	extern task peek(output T msge);
	extern function bit try_put(input T msge);
	extern function bit try_get(output T msge);
	extern function bit try_peek(output T msge);
	extern function int unsigned num();
endclass

task emailbox::put(input T msge);
if(size != 0) begin
	if(que.size() == size)
		wait(que.size() < size);
end
que.push_back(msge);
endtask: put

task emailbox::get(output T msge);
	if(que.size() == 0)
		wait(que.size() > 0);
	msge = que.pop_front();
endtask: get

task emailbox::peek(output T msge);
	if(que.size() == 0)
		wait(que.size() > 0);
	msge = que[0];
endtask: peek

function bit emailbox::try_put(input T msge);
if(size != 0) begin
	if(que.size() == size)
		return 0;
end
que.push_back(msge);
return 1;
endfunction: try_put

function bit emailbox::try_get(output T msge);
	if(que.size() == 0)
		return 0;
	else
		msge = que.pop_front();
	return 1;
endfunction: try_get

function bit emailbox::try_peek(output T msge);
	if(que.size() == 0)
		return 0;
	else
		msge = que[0];
	return 1;
endfunction: try_peek

function int unsigned emailbox::num();
	return que.size();
endfunction: num
//----------------------------------------------------------------------


class single_class;
	rand bit [2:0] var1;
	rand byte var2;
	constraint c1 {
		var2 >= 0;
		var2 <= 250;
	}
	function void disp();
		$display("valus are: %0d %0d", var1, var2);
	endfunction
endclass

module mail_methods();
	emailbox #(single_class) mbox1 = new();
	single_class obj1 = new();
	function void disp_prop();
	foreach(mbox1.que[i])
		$display("values of queue : %0p", mbox1.que[i]);
	endfunction
	initial begin
		repeat(5) begin
		obj1 = new();
		$display("add: %0d", obj1);
		obj1.randomize();
		mbox1.put(obj1);
		obj1.disp();
		$display("size: %0d", mbox1.num());
		end
		disp_prop();
		repeat(8) begin
		mbox1.get(obj1);
		$display("values after get : %0p", obj1);
		$display("size: %0d", mbox1.num());
		disp_prop();
		end
	end
endmodule

