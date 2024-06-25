regress: lib del_log log sim cover delete

lib:
	vlib work

log:
	vlog -coveropt 3 +acc +cover fifo_rtl.sv fifo_pack.sv fifo_top.sv 

sim:
	vsim -vopt fifo_top -suppress 12110 +SANITY -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +CONTINUOUS_WR_RD -c -do "coverage save -onexit -directive -cvg -codeall continuous_wr_rd.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +FULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall full_flag.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +EMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall empty_flag.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +ALMOSTFULL_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostfull_flag.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +ALMOSTEMPTY_FLAG -c -do "coverage save -onexit -directive -cvg -codeall almostempty_flag.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +READ_EMPTY -c -do "coverage save -onexit -directive -cvg -codeall read_empty.ucdb; run -all; -l transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +WRITE_FULL -c -do "coverage save -onexit -directive -cvg -codeall write_full.ucdb; run -all; -l  transcript.log; exit"
	vsim -vopt fifo_top -suppress 12110 +INBETWEEN_RESET -c -do "coverage save -onexit -directive -cvg -codeall inbet_rst.ucdb; run -all; -l  transcript.log; exit"

cover:
	vcover merge async_fifo.ucdb sanity.ucdb continuous_wr_rd.ucdb full_flag.ucdb empty_flag.ucdb almostfull_flag.ucdb almostempty_flag.ucdb inbet_rst.ucdb read_empty.ucdb write_full.ucdb
	vcover report -details -htmldir functional_cvg -html async_fifo.ucdb 

del_log:
	del transcript.log

delete:
	del sanity.ucdb continuous_wr_rd.ucdb full_flag.ucdb empty_flag.ucdb almostfull_flag.ucdb almostempty_flag.ucdb write_full.ucdb


work:
	add wave sim:fifo_top/dut/*
	add wave sim:fifo_top/intf/*
	do wave.do

run:
	run -all

mem:
	do mem.do
