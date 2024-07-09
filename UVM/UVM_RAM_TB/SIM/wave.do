onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/clk
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/rst
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/ram_en
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/wr_enb
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/wr_addr
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/wr_data
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/rd_enb
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/rd_addr
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/rd_data
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/ram
add wave -noupdate -expand -label sim:/ram_tb_top/dut/Group1 -group {Region: sim:/ram_tb_top/dut} /ram_tb_top/dut/i
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/clk
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/ram_en
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/wr_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/wr_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/wr_data
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/rd_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/rd_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/Group1 -group {Region: sim:/ram_tb_top/intf} /ram_tb_top/intf/rd_data
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/ram_en
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/wr_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/rd_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/wr_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/rd_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/wr_data
add wave -noupdate -expand -label sim:/ram_tb_top/intf/drv_cb/Group1 -group {Region: sim:/ram_tb_top/intf/drv_cb} /ram_tb_top/intf/drv_cb/drv_cb_event
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/ram_en
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/wr_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/rd_enb
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/wr_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/rd_addr
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/wr_data
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/rd_data
add wave -noupdate -expand -label sim:/ram_tb_top/intf/mon_cb/Group1 -group {Region: sim:/ram_tb_top/intf/mon_cb} /ram_tb_top/intf/mon_cb/mon_cb_event
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {68 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 94
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
WaveRestoreZoom {0 ns} {236 ns}
