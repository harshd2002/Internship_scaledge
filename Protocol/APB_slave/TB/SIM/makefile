regress: lib log sim cover delete 

lib:
	vlib work

log:
	vlog -coveropt 3 +acc +cover ../RTL/APB_slave.v ../TEST/APB_pack.sv ../TOP/APB_top.sv +incdir+../ENV +incdir+../TEST

sim:
	vsim -coverag -assertdebug apb_top -suppress 12110 +SANITY_WR -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; run -all; exit"
	vsim -coverag -assertdebug apb_top -suppress 12110 +WAIT_STATE_WR -c -do "coverage save -onexit -directive -cvg -codeall wait_state.ucdb; run -all; exit"
	vsim -coverag -assertdebug apb_top -suppress 12110 +BACK2BACK_WR -c -do "coverage save -onexit -directive -cvg -codeall back2back.ucdb;;run -all; exit"
	vsim -coverag -assertdebug apb_top -suppress 12110 +BACK2BACK_WR_WS -c -do "coverage save -onexit -directive -cvg -codeall back2back_ws.ucdb; run -all; exit"
	vsim -coverag -assertdebug apb_top -suppress 12110 +IN_BETWEEN_RESET -c -do "coverage save -onexit -directive -cvg -codeall in_bet_rst.ucdb; run -all; exit"
	vsim -coverag -assertdebug apb_top -suppress 12110 +SLAVE_ERROR -c -do "coverage save -onexit -directive -cvg -codeall slave_error.ucdb; run -all; exit"

cover:
	vcover merge apb_cvg_rep.ucdb sanity.ucdb wait_state.ucdb back2back.ucdb back2back_ws.ucdb in_bet_rst.ucdb slave_error.ucdb

delete:	 
	vcover report -details -html apb_cvg_rep.ucdb -htmldir APB_report
	del sanity.ucbd wait_state.ucbd back2back.ucbd back2back_ws.ucbd in_bet_rst.ucbd slave_error.ucdb

wave:
	do wave.do

run:
	run -all

mem:
	do mem.do
