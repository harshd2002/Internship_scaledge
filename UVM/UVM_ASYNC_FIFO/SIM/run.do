vlib work

vlog ../RTL/fifo_rtl.sv ../TEST/fifo_pkg.sv ../TOP/fifo_tb_top.sv +incdir+../TEST +incdir+../ENV

#vsim -voptargs=+acc fifo_tb_top +UVM_OBJECTION_TRACE
vsim -voptargs=+acc fifo_tb_top +UVM_OBJECTION_TRACE +UVM_TESTNAME=${1}

do wave.do

run -all
