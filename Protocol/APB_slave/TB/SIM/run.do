vlib work

vlog ../RTL/APB_slave.v ../TEST/APB_pack.sv ../TOP/APB_top.sv +incdir+../ENV +incdir+../TEST

#vsim -voptargs=+acc apb_top -suppress 12110 +SANITY_WR
#vsim -voptargs=+acc apb_top -suppress 12110 +WAIT_STATE_WR
#vsim -voptargs=+acc apb_top -suppress 12110 +BACK2BACK_WR
#vsim -voptargs=+acc apb_top -suppress 12110 +BACK2BACK_WR_WS

#add wave sim:apb_top/dut/*
#add wave sim:apb_top/intf/*

do wave.do
do mem.do
run -all
