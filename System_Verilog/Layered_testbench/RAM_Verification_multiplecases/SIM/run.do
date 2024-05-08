vlib work
vlog ../RTL/ram_rtl.sv ../TEST/ram_pack.sv ../TOP/ram_top.sv +incdir+../ENV +incdir+../TEST
vsim -novopt ram_top +LRANGE_DATA_TEST
add wave -r /*
run -all
