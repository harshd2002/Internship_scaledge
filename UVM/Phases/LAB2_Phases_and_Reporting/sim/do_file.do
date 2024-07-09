
vlib work
vdel -all
vlib work


#vlog ./packages/pkg.sv ./tb/top.sv +incdir+./agent_top

vlog ../packages/pkg.sv ../tb/top.sv +incdir+../env +incdir+../test




vsim work.top

#add wave -r*

run -all



#vlog ../packages/pkg.sv ../tb/top.sv +incdir+../agent_top
