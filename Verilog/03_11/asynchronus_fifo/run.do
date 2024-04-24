vlog -coveropt 3 +acc +cover async_fifo.v tb.v

vsim -vopt -coverage work.tb +sanity_test +fifo_full +fifo_empty +simultaneous_rw +continuous_rw +fifo_half_full

do wave.do
do mem.do
run -all
