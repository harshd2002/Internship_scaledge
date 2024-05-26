vlib work
vlog ../RTL/async_fifo.v ../TEST/fifo_pack.sv ../TOP/fifo_top.sv +incdir+../ENV +incdir+../TEST 
vsim -novopt fifo_top -suppress 12110 +SANITY
#vsim -novopt fifo_top -suppress 12110 +SIMULTANEOUS_WR
#vsim -novopt fifo_top -suppress 12110 +CONTINUOUS_WR
#vsim -novopt fifo_top -suppress 12110 +BACKTOBACK_WR
#vsim -novopt fifo_top -suppress 12110 +INBETWEEN_RESET
add wave sim:fifo_top/dut/*
add wave sim:fifo_top/intf/*
#do wave.do
run -all
#do mem.do
