lib:
	vlib work

log:
	vlog -coveropt 3 +acc +cover async_fifo.v tb.v

sim:
	vsim -vopt -coverage work.tb +sanity_test -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; run -all; exit" 
	vsim -vopt -coverage work.tb +fifo_full -c -do "coverage save -onexit -directive -cvg -codeall full.ucdb; run -all; exit" 
	vsim -vopt -coverage work.tb +fifo_empty -c -do "coverage save -onexit -directive -cvg -codeall empty.ucdb; run -all; exit" 
	vsim -vopt -coverage work.tb +simultaneous_rw -c -do "coverage save -onexit -directive -cvg -codeall simul.ucdb; run -all; exit" 
	vsim -vopt -coverage work.tb +continuous_rw -c -do "coverage save -onexit -directive -cvg -codeall cont.ucdb; run -all; exit" 
	vsim -vopt -coverage work.tb +fifo_half_full -c -do "coverage save -onexit -directive -cvg -codeall half_full.ucdb; run -all; exit" 

merge:
	vcover merge asynchronus_fifo.ucdb sanity.ucdb full.ucdb empty.ucdb simul.ucdb cont.ucdb half_full.ucdb

delete:
	del sanity.ucdb full.ucdb empty.ucdb simul.ucdb cont.ucdb half_full.ucdb

html:
	vcover report -html asynchronus_fifo.ucdb -htmldir async_fifo_makfile_coverage

run: lib log sim merge delete html
	
