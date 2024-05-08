onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/clk
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rst
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_enbl
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_enbl
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_addr
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_addr
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_data
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_data
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/i
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/clk
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rst
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rd_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_addr
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rd_addr
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_data
add wave -noupdate /mem_top/intf/rd_data
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/wr_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/rd_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/wr_addr
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/rd_addr
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/wr_data
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb/Group1 -group {Region: sim:/mem_top/intf/mem_cb} /mem_top/intf/mem_cb/mem_cb_event
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/wr_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/rd_enbl
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/wr_addr
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/rd_addr
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/wr_data
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/rd_data
add wave -noupdate -expand -label sim:/mem_top/intf/mem_cb_mon/Group1 -group {Region: sim:/mem_top/intf/mem_cb_mon} /mem_top/intf/mem_cb_mon/mem_cb_mon_event
add wave -noupdate /pkg_files::item_done
add wave -noupdate /pkg_files::reset_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {129 ns}
