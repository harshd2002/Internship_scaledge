
regress: log sim merge delete report


log:
	vlog -coveropt 3 +acc +cover round_robin_arbiter.v tb.v

sim:
	vsim -vopt -coverage work.tb +sanity -c -do "coverage save -onexit -directive -cvg -codeall sanity.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +priority_check -c -do "coverage save -onexit -directive -cvg -codeall priority_check.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +ideal_transition  -c -do "coverage save -onexit -directive -cvg -codeall ideal_transition.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +s1_transition  -c -do "coverage save -onexit -directive -cvg -codeall s1_transition.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +s2_transition  -c -do "coverage save -onexit -directive -cvg -codeall s2_transition.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +s3_transition  -c -do "coverage save -onexit -directive -cvg -codeall s3_transition.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +s4_transition  -c -do "coverage save -onexit -directive -cvg -codeall s4_transition.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	vsim -vopt -coverage work.tb +inbetween_reset  -c -do "coverage save -onexit -directive -cvg -codeall inbetween_reset.ucdb; run -all;coverage exclude -srcfile round_robin_arbiter.v -linerange 101-103; exit" 
	
merge:
	vcover merge async_fifo_cov.ucdb sanity.ucdb priority_check.ucdb ideal_transition.ucdb s1_transition.ucdb s2_transition.ucdb s3_transition.ucdb s4_transition.ucdb inbetween_reset.ucdb

delete:
	del sanity.ucdb priority_check.ucdb ideal_transition.ucdb s1_transition.ucdb s2_transition.ucdb s3_transition.ucdb s4_transition.ucdb inbetween_reset.ucdb

report:
	vcover report -html async_fifo_cov.ucdb -htmldir round_robin_makefile_coverage

