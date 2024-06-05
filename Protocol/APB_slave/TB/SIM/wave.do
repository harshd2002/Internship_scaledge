onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pclk
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/presetn
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pselect
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/penable
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pready
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pslverr
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pwrite
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/paddr
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pwdata
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/prdata
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/pr_state
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/nxt_state
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/wait_state
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/time_out
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/timer_o
add wave -noupdate -expand -label sim:/apb_top/dut/Group1 -group {Region: sim:/apb_top/dut} /apb_top/dut/t_counter
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Pclk
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Presetn
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Psel
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Penable
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Pready
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Pslverr
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Pwrite
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Paddr
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Pwdata
add wave -noupdate -expand -label sim:/apb_top/intf/Group1 -group {Region: sim:/apb_top/intf} /apb_top/intf/Prdata
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Psel
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Penable
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Pready
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Pwrite
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Paddr
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/Pwdata
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_drv/Group1 -group {Region: sim:/apb_top/intf/apb_cb_drv} /apb_top/intf/apb_cb_drv/apb_cb_drv_event
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Psel
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Penable
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Pready
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Pslverr
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Pwrite
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Paddr
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Pwdata
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/Prdata
add wave -noupdate -expand -label sim:/apb_top/intf/apb_cb_mon/Group1 -group {Region: sim:/apb_top/intf/apb_cb_mon} /apb_top/intf/apb_cb_mon/apb_cb_mon_event
add wave -noupdate /apb_top/intf/SETUP_STATE
add wave -noupdate /apb_top/intf/ACCESS_STATE
add wave -noupdate /apb_top/intf/SIGNAL_STABILITY
add wave -noupdate /apb_top/intf/WRITE_DATA_STABILITY
add wave -noupdate /apb_top/intf/NEXT_TRANSFER_CHECK
add wave -noupdate /apb_top/intf/RESET_CHECK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 120
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {478 ns}
