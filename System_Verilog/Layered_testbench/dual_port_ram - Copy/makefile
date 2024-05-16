regress: lib log sim cover delete 

lib:
	vlib work

log:
	vlog ram_top.sv 

sim:
	vsim -novopt mem_top -suppress 12110 +SANITY_TEST -c -do "coverage save -onexit -directive -cvg -codeall test1.ucdb; run -all; exit"
	vsim -novopt mem_top -suppress 12110 +SIMULTANEOUS_WR -c -do "coverage save -onexit -directive -cvg -codeall test2.ucdb; run -all; exit"
	vsim -novopt mem_top -suppress 12110 +CONTINUOUS_WR -c -do "coverage save -onexit -directive -cvg -codeall test3.ucdb; run -all; exit"
	vsim -novopt mem_top -suppress 12110 +BACKTOBACK_WR -c -do "coverage save -onexit -directive -cvg -codeall test4.ucdb; run -all; exit"
	vsim -novopt mem_top -suppress 12110 +INBETWEEN_RESET -c -do "coverage save -onexit -directive -cvg -codeall test5.ucdb; run -all; exit"

cover:
	vcover merge ram.ucdb test1.ucdb test2.ucdb test3.ucdb test4.ucdb test5.ucdb

delete:	 
	del test1.ucbd test2.ucbd test3.ucbd test4.ucbd test5.ucbd
	vcover report -html ram.ucdb

wave:
	add wave sim:mem_top/dut/*
	add wave sim:mem_top/intf/*
	do wave.do

run:
	run -all

mem:
	do mem.do
