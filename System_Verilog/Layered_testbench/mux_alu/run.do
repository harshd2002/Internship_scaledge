vlib work
vlog top.sv
vsim -novopt top -suppress 12110 -sv_seed 2
add wave sim:top/dut/*
add wave sim:top/intf/*
run -all
