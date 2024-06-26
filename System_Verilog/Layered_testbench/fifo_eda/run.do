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

#vsim -vopt fifo_top -suppress 12110 +SANITY -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -voptargs=+acc fifo_top -suppress 12110 +CONTINUOUS_WR_RD -c -do "coverage save -onexit -directive -cvg -codeall continuous_wr_rd.ucdb; do wave.do; run -all" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +FULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall full_flag.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +EMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall empty_flag.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +ALMOSTFULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostfull_flag.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +ALMOSTEMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostempty_flag.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +INBETWEEN_RESET -c -do "coverage save -onexit -directive -cvg -codeall inbet_rst.ucdb; do wave.do; run -all; exit" -l transcript.log
#vsim -vopt fifo_top -suppress 12110 +READ_EMPTY -c -do "coverage save -onexit -directive -cvg -codeall read_empty.ucdb; do wave.do; run -all; exit" -l transcript.log
vsim -vopt fifo_top -suppress 12110 +WRITE_FULL -c -do "coverage save -onexit -directive -cvg -codeall write_full.ucdb; do wave.do; run -all; exit" -l transcript.log


#add wave sim:fifo_top/dut/*
#add wave sim:fifo_top/intf/*
do wave.do
#run -all
do mem.do
