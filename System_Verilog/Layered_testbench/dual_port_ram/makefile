regress: lib log sim wave run mem

lib:
	vlib work

log:
	vlog ram_top.sv 

sim:
	vsim -novopt mem_top -suppress 12110 +SANITY_TEST
	vsim -novopt mem_top -suppress 12110 +SIMULTANEOUS_WR
	vsim -novopt mem_top -suppress 12110 +CONTINUOUS_WR
	vsim -novopt mem_top -suppress 12110 +BACKTOBACK_WR
	vsim -novopt mem_top -suppress 12110 +INBETWEEN_RESET

wave:
	add wave sim:mem_top/dut/*
	add wave sim:mem_top/intf/*
	do wave.do

run:
	run -all

mem:
	do mem.do
