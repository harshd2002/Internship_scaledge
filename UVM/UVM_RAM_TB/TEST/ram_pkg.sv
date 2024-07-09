////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : HARSH_DEVDA
//File_Name    : ram_pkg.sv
//File_Path    : 
//Class_Name   : ram_pkg               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`include "ram_intf.sv"

package ram_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  //enum type variable for selecting operation
  //enum operation_e
  //READ  - to perform read operation
  //WRITE - to perform write operation
  typedef enum bit {READ, WRITE} operation_e;

  `include "ram_seqs_item.sv"
  `include "ram_sequencer.sv"
  `include "ram_vseqr.sv"
  `include "ram_base_seqs.sv"
  `include "ram_base_vseqs.sv"
  `include "ram_seqs_wr_rd.sv"
  `include "ram_seqs_continuous_wr.sv"
  `include "ram_seqs_continuous_rd.sv"
  `include "ram_vseqs_continuous_wr_rd.sv"
  `include "ram_drv_cb.sv"
  `include "ram_driver.sv"
  `include "ram_mon.sv"
  `include "ram_agent.sv"
  `include "ram_scrbd.sv"
  `include "ram_env.sv"
  `include "ram_base_test.sv"
  `include "ram_test_sanity.sv"
  `include "ram_test_cs_cb.sv"
  `include "ram_test_continuous_wr_rd.sv"

endpackage
