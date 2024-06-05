////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//Header
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

//APB interface

`ifndef APB_INTERFACE
`define APB_INTERFACE

interface apb_intf(input Pclk, input Presetn);
  logic [31:0] Paddr;
  logic [31:0] Pwdata, Prdata;
  logic Psel, Penable, Pwrite;
  logic Pready, Pslverr;

  clocking apb_cb_drv @(posedge Pclk);
    default input #1 output #1;
    output Psel, Penable, Pwrite, Paddr, Pwdata;
    input Pready;
  endclocking

  clocking apb_cb_mon @(posedge Pclk);
    default input #0 output #1;
    input Psel, Penable, Pwrite, Paddr, Pwdata;
    input Prdata,Pready,Pslverr;
  endclocking

  modport apb_mp_drv(clocking apb_cb_drv, input Pclk, input Presetn);
  modport apb_mp_mon(clocking apb_cb_mon, input Pclk, input Presetn);

    //$fell can be used   //first_match   //through_out
    //in wait state check sel and enable stability
    //prdata case check
    //check whe reset is asserted and drive values - can use ifndef for master and slave
    //assertion for clock
    
  //default disable statement for all assertions (except for reset)
  default disable iff(!Presetn);

  sequence setup_seq;
    Psel ##0 $rose(Penable) ;
  endsequence

  // checking setup to access state transition
  property setup_state;
    @(posedge Pclk)
    first_match($rose(Psel)) |=> $rose(Penable);
  endproperty

  // checking pready arrival after entering access state
  property access_state;
    @(posedge Pclk)
    setup_seq |->##[0:TIMER_OUT-1] Pready;
  endproperty

  //sequence for checking stability of siganl untill PREADY occurs
  sequence stability_check_seq;
    ($stable(Paddr) ##0 $stable(Pwdata) ##0 $stable(Pwrite)) throughout (Pready [->1]);
  endsequence

  //sequence for checking stability of PSEL and PENABLE in wait state
  sequence stability_ws_seq
    ($stable(Psel) ##0 $stable(Penable)) throughout (Pready [->1]);
  endsequence

  //checking PSEL and PENABLE signal stability when in wait state
  property signal_stability_ws;
    @(posedge Pclk)
    setup_seq |-> stability_ws_seq;
  endproperty

  //checking signal stability untill PREADY is asserted
  property signal_stability;
    @(posedge Pclk)
    setup_seq |-> stability_check_seq;
  endproperty

  // checking write data stability when PWRITE is high
  property write_data_stability;
    @(posedge Pclk)
    setup_seq ##0 Pwrite |-> ($stable(Pwdata));
  endproperty

  //checking that after a transfer completes, PENABLE should be dropped
  property next_transfer_check;
    @(posedge Pclk)
    $rose(Pready) |=> $fell(Penable);   
  endproperty

  // checking slave error is generated when PREADY, PENABLE and PSEL are high
  property slave_error_check;
    @(posedge Pclk)
    $rose(Pslverr) |-> Pready ##0 Penable ##0 Psel;
  endproperty

  // checking that when reset  is asserted, PSEL and PENABLE should be de-asserted
  property reset_check();  // rst = !Presetn
    @(posedge Pclk) disable iff (Presetn)  //!rst == !(!Presetn) == Presetn
      $fell(Presetn) |-> $fell(Psel) ##0 $fell(Penable);
  endproperty

  SETUP_STATE:          assert property (setup_state)
                          $info("PASS: setup_state asssertion");
                        else
                          $error("FAIL: setup_state assertion");
  ACCESS_STATE:         assert property (access_state)
                          $info("PASS: access_state assertion");
                        else
                          $error("FAIL: access_state assertion");
  SIGNAL_STABILITY:     assert property (signal_stability)
                          $info("PASS:  signal_stability assertion");
                        else
                          $error("FAIL: signal_stability assertion");
  WRITE_DATA_STABILITY: assert property (write_data_stability)
                          $info("PASS: write_data_stability assertion");
                        else
                          $error("FAIL: write_data_stability assertion");
  SIGNAL_STABILITY_WS:  assert property (signal_stability_ws)
                          $info("PASS:  signal_stability_ws assertion");
                        else
                          $error("FAIL: signal_stability_ws assertion");
  NEXT_TRANSFER_CHECK:  assert property (next_transfer_check)
                          $info("PASS: next_transfer_check assertion");
                        else
                          $error("FAIL: next_transfer_check assertion");
  SLV_ERR_CHECK:        assert property (slave_error_check)
                          $info("PASS: slave_error_check assertion");
                        else
                          $error("FAIL: slave_error_check assertion");
  RESET_CHECK:          assert property (reset_check)
                          $info("PASS: reset_check assertion");
                        else
                          $error("FAIL: reset_check assertion");

endinterface

`endif
