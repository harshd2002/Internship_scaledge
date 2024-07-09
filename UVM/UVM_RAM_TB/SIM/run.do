vlib work

vlog ../RTL/ram_16x8.v ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv +incdir+../TEST +incdir+../ENV

vsim -voptargs=+acc ram_tb_top +UVM_OBJECTION_TRACE +UVM_TESTNAME=${1}

do wave.do

run -all
