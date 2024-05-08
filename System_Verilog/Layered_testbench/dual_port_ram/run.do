vlib work
vlog ram_top.sv 
#vsim -novopt mem_top -suppress 12110 +SANITY_TEST
#vsim -novopt mem_top -suppress 12110 +SIMULTANEOUS_WR
#vsim -novopt mem_top -suppress 12110 +CONTINUOUS_WR
#vsim -novopt mem_top -suppress 12110 +BACKTOBACK_WR
 vsim -novopt mem_top -suppress 12110 +INBETWEEN_RESET
#add wave sim:mem_top/dut/*
#add wave sim:mem_top/intf/*
do wave.do
add wave -position insertpoint  \
sim:/pkg_files::item_done \
sim:/pkg_files::reset_done
run -all
do mem.do
