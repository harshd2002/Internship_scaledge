vlib work
vlog -coveropt 3 +acc +cover ../RTL/rtl.sv ../TEST/package_1.sv ../TOP/top.sv +incdir+../ENV +incdir+../TEST
vsim -voptargs=+acc +SANITY_CHECK work.top
add wave -r /*
run -all
