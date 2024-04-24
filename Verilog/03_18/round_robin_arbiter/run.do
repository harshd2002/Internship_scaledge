vlib work

vlog -coveropt 3 +acc +cover round_robin_arbiter.v tb.v

vsim -vopt -coverage work.tb +sanity +priority_check +ideal_transition +s1_transition +s2_transition +s3_transition +s4_transition +inbetween_reset
coverage save -onexit -directive -cvg -codeall round_robin.ucdb
coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103

do wave.do

run -all
