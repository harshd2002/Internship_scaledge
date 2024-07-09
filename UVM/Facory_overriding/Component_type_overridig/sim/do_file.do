
vlib work
vdel -all
vlib work

#vlog ./packages/pkg.sv ./tb/top.sv +incdir+./agent_top

vlog ../packages/pkg.sv ../tb/top.sv +incdir+../env +incdir+../test

vsim work.top +UVM_VERBOSITY=UVM_MEDIUM

#add wave -r*

run -all

