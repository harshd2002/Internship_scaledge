onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/dff_top/intf/dff_cb/Group1 -group {Region: sim:/dff_top/intf/dff_cb} /dff_top/intf/dff_cb/q
add wave -noupdate -expand -label sim:/dff_top/intf/dff_cb/Group1 -group {Region: sim:/dff_top/intf/dff_cb} /dff_top/intf/dff_cb/d
add wave -noupdate -expand -label sim:/dff_top/intf/dff_cb/Group1 -group {Region: sim:/dff_top/intf/dff_cb} /dff_top/intf/dff_cb/rstn
add wave -noupdate -expand -label sim:/dff_top/dut/rtlp/Group1 -group {Region: sim:/dff_top/dut/rtlp} /dff_top/dut/rtlp/clk
add wave -noupdate -expand -label sim:/dff_top/dut/rtlp/Group1 -group {Region: sim:/dff_top/dut/rtlp} /dff_top/dut/rtlp/d
add wave -noupdate -expand -label sim:/dff_top/dut/rtlp/Group1 -group {Region: sim:/dff_top/dut/rtlp} /dff_top/dut/rtlp/q
add wave -noupdate -expand -label sim:/dff_top/dut/rtlp/Group1 -group {Region: sim:/dff_top/dut/rtlp} /dff_top/dut/rtlp/rstn
add wave -noupdate -expand -label sim:/dff_top/tb/tbp/Group1 -group {Region: sim:/dff_top/tb/tbp} /dff_top/tb/tbp/clk
add wave -noupdate -expand -label sim:/dff_top/tb/tbp/Group1 -group {Region: sim:/dff_top/tb/tbp} /dff_top/tb/tbp/d
add wave -noupdate -expand -label sim:/dff_top/tb/tbp/Group1 -group {Region: sim:/dff_top/tb/tbp} /dff_top/tb/tbp/q
add wave -noupdate -expand -label sim:/dff_top/tb/tbp/Group1 -group {Region: sim:/dff_top/tb/tbp} /dff_top/tb/tbp/rstn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 259
configure wave -valuecolwidth 73
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
WaveRestoreZoom {0 ns} {88 ns}
