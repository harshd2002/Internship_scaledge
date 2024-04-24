//test module

`include "and_transaction.sv"
`include "and_gen.sv"
`include "and_drv.sv"
`include "and_intf.sv"
`include "and_rtl.sv"
`include "and_env.sv"

module and_test(and_intf.TB_P tbp);
	and_env env_obj;
	initial begin
		env_obj = new(tbp);
		env_obj.build();
		env_obj.run();
	end
endmodule

