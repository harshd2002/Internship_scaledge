onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_clk
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_clk
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rstn
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_en
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_en
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_data
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_data
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/full
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/empty
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/almost_full
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/almost_empty
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/overflow
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/underflow
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_ptr
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_ptr
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/g_wr_ptr
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/g_rd_ptr
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_ptr_1
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_ptr_1
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_ptr_3
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_ptr_3
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/wr_ptr_2
add wave -noupdate -expand -label sim:/fifo_top/dut/Group1 -group {Region: sim:/fifo_top/dut} /fifo_top/dut/rd_ptr_2
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/wr_clk
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/rd_clk
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/rstn
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/wr_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/rd_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/wr_data
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/rd_data
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/full
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/empty
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/almost_full
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/almost_empty
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/overflow
add wave -noupdate -expand -label sim:/fifo_top/intf/Group1 -group {Region: sim:/fifo_top/intf} /fifo_top/intf/underflow
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_drv_cb} /fifo_top/intf/wr_drv_cb/full
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_drv_cb} /fifo_top/intf/wr_drv_cb/overflow
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_drv_cb} /fifo_top/intf/wr_drv_cb/wr_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_drv_cb} /fifo_top/intf/wr_drv_cb/wr_data
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_drv_cb} /fifo_top/intf/wr_drv_cb/wr_drv_cb_event
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_drv_cb} /fifo_top/intf/rd_drv_cb/empty
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_drv_cb} /fifo_top/intf/rd_drv_cb/underflow
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_drv_cb} /fifo_top/intf/rd_drv_cb/rd_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_drv_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_drv_cb} /fifo_top/intf/rd_drv_cb/rd_drv_cb_event
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/full
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/almost_full
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/overflow
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/wr_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/wr_data
add wave -noupdate -expand -label sim:/fifo_top/intf/wr_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/wr_mon_cb} /fifo_top/intf/wr_mon_cb/wr_mon_cb_event
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/empty
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/almost_empty
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/underflow
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/rd_enbl
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/rd_data
add wave -noupdate -expand -label sim:/fifo_top/intf/rd_mon_cb/Group1 -group {Region: sim:/fifo_top/intf/rd_mon_cb} /fifo_top/intf/rd_mon_cb/rd_mon_cb_event
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {210 ns}
