onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dut/wr_clk
add wave -noupdate /tb/dut/rd_clk
add wave -noupdate /tb/dut/wr_rstn
add wave -noupdate /tb/dut/rd_rstn
add wave -noupdate /tb/dut/wr_en
add wave -noupdate /tb/dut/rd_en
add wave -noupdate /tb/dut/wr_data
add wave -noupdate /tb/dut/rd_data
add wave -noupdate /tb/dut/full
add wave -noupdate /tb/dut/empty
add wave -noupdate /tb/dut/almost_full
add wave -noupdate /tb/dut/almost_empty
add wave -noupdate -radix hexadecimal /tb/dut/wr_ptr
add wave -noupdate -radix hexadecimal /tb/dut/rd_ptr
add wave -noupdate /tb/dut/g_wr_ptr
add wave -noupdate /tb/dut/g_rd_ptr
add wave -noupdate /tb/dut/wr_ptr_1
add wave -noupdate /tb/dut/rd_ptr_1
add wave -noupdate /tb/dut/wr_ptr_2
add wave -noupdate /tb/dut/rd_ptr_2
add wave -noupdate /tb/dut/wr_clk
add wave -noupdate /tb/dut/rd_clk
add wave -noupdate /tb/dut/overflow
add wave -noupdate /tb/dut/underflow
add wave -noupdate /tb/exp_rd_data
add wave -noupdate /tb/exp_full
add wave -noupdate /tb/exp_empty
add wave -noupdate /tb/exp_almost_full
add wave -noupdate /tb/exp_almost_empty
add wave -noupdate /tb/wr_ptr
add wave -noupdate /tb/rd_ptr
add wave -noupdate /tb/wr_wrap
add wave -noupdate /tb/rd_wrap
add wave -noupdate /tb/wr_1
add wave -noupdate /tb/rd_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1153756 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {927313 ps} {1898563 ps}
