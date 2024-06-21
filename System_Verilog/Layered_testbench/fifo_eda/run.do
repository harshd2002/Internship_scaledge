vlib work
vlog -coveropt 3 +acc +cover fifo_rtl.sv fifo_pack.sv fifo_top.sv 
#vsim -novopt fifo_top -suppress 12110 +SANITY
#vsim -novopt fifo_top -suppress 12110 +CONTINUOUS_WR_RD
#vsim -novopt fifo_top -suppress 12110 +FULL_FLAG
#vsim -novopt fifo_top -suppress 12110 +EMPTY_FLAG
#vsim -novopt fifo_top -suppress 12110 +ALMOSTFULL_FLAG
#vsim -novopt fifo_top -suppress 12110 +ALMOSTEMPTY_FLAG
#vsim -novopt fifo_top -suppress 12110 +${1}
#vsim -novopt fifo_top -suppress 12110 +INBETWEEN_RESET

#vsim -vopt fifo_top -suppress 12110 +SANITY -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; run -all; exit"
#vsim -vopt fifo_top -suppress 12110 +CONTINUOUS_WR_RD -c -do "coverage save -onexit -directive -cvg -codeall continuous_wr_rd.ucdb; run -all; exit"
#vsim -vopt fifo_top -suppress 12110 +FULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall full_flag.ucdb; run -all; exit"
#vsim -vopt fifo_top -suppress 12110 +EMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall empty_flag.ucdb; run -all; exit"

vsim -vopt fifo_top -suppress 12110 +ALMOSTFULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostfull_flag.ucdb; run -all; exit"
#vsim -vopt fifo_top -suppress 12110 +ALMOSTEMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostempty_flag.ucdb; run -all; exit"
#vsim -vopt fifo_top -suppress 12110 +ALMOSTEMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostempty_flag.ucdb; run -all; exit"

#vcover merge async_fifo.ucdb sanity.ucdb continuous_wr_rd.ucdb full_flag.ucdb empty_flag.ucdb almostfull_flag.ucdb almostempty_flag.ucdb
#del sanity.ucdb continuous_wr_rd.ucdb full_flag.ucdb empty_flag.ucdb almostfull_flag.ucdb almostempty_flag.ucdb
#vcover report -html async_fifo.ucdb 

#add wave sim:fifo_top/dut/*
#add wave sim:fifo_top/intf/*
do wave.do
#run -all
do mem.do
