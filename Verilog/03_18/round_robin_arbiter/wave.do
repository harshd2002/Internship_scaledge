onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/clk
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/rst
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/req
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/grant
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/crt
add wave -noupdate -expand -label sim:/tb/dut/Group1 -group {Region: sim:/tb/dut} /tb/dut/gnt
add wave -noupdate -expand -label sim:/tb/Group1 -group {Region: sim:/tb} /tb/exp_grant
add wave -noupdate -expand -label sim:/tb/Group1 -group {Region: sim:/tb} /tb/gnt
add wave -noupdate -expand -label sim:/tb/Group1 -group {Region: sim:/tb} /tb/flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {612962 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {436909 ps} {707285 ps}
