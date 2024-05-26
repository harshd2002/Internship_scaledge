vlib work
vlog top.sv
#vsim -novopt top -suppress 12110 +SANITY_CHECK
#vsim -novopt top -suppress 12110 +SELECT_0
#vsim -novopt top -suppress 12110 +SELECT_1
#vsim -novopt top -suppress 12110 +SELECT_2
vsim -novopt top -suppress 12110 +SELECT_3
#vsim -novopt top -suppress 12110 +SELECT_4
#vsim -novopt top -suppress 12110 +SELECT_5
#vsim -novopt top -suppress 12110 +SELECT_6
#vsim -novopt top -suppress 12110 +RSTN_ON_FLY
#vsim -novopt top -suppress 12110 +INVALID_SELECT
add wave sim:top/dut/*
add wave sim:top/intf/*
run -all
