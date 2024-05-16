////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Project: dualport RAM verification
//File name: pkg_files.sv
//description: package for including all files
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//RAM files are included

`ifndef RAM_PACKKAGE
`define RAM_PACKKAGE


package pkg_files;
  `include "pkg_global.sv"
	`include "ram_trans.sv"
	`include "ram_gen.sv"
  `include "ram_gen_sanity_test.sv"
  `include "ram_gen_continuous_wr.sv"
  `include "ram_gen_simultaneous_wr.sv"
  `include "ram_gen_backtoback_wr.sv"
  `include "ram_gen_inbetween_reset.sv"
	`include "ram_drv.sv"
	`include "ram_mon.sv"
	`include "ram_pred.sv"
	`include "ram_scrbd.sv"
	`include "ram_env.sv"
	`include "ram_test.sv"
endpackage
`endif
