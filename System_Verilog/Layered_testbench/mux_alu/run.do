vlib work
vlog ram_top.sv
vsim -novopt mem_top -suppress 12110 
add wave sim:mem_top/dut/*
add wave sim:mem_top/intf/*
run -all
