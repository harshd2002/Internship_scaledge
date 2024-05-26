regress: lib log sim cover delete 

lib:
	vlib work

log:
	vlog -coveropt 3 +acc +cover ../RTL/APB_slave.v ../TEST/APB_pack.sv ../TOP/APB_top.sv +incdir+../ENV +incdir+../TEST

sim:
	vsim -coverage apb_top -suppress 12110 +SANITY_WR -c -do "coverage save -onexit -directive -cvg -codeall test1.ucdb; run -all; exit"
	vsim  -coverage apb_top -suppress 12110 +WAIT_STATE_WR -c -do "coverage save -onexit -directive -cvg -codeall test2.ucdb; run -all; exit"
	vsim  -coverage apb_top -suppress 12110 +BACK2BACK_WR -c -do "coverage save -onexit -directive -cvg -codeall test3.ucdb;;run -all; exit"
	vsim  -coverage apb_top -suppress 12110 +BACK2BACK_WR_WS -c -do "coverage save -onexit -directive -cvg -codeall test4.ucdb; run -all; exit"

cover:
	vcover merge apb_cvg_rep.ucdb test1.ucdb test2.ucdb test3.ucdb test4.ucdb

delete:	 
	del test1.ucbd test2.ucbd test3.ucbd test4.ucbd test5.ucbd
	vcover report -details -html apb_cvg_rep.ucdb -htmldir APB_report

wave:
	do wave.do

run:
	run -all

mem:
	do mem.do
