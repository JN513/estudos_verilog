#!/usr/bin/zsh
yosys -p 'read_verilog top.v; synth_ecp5 -json out.json'
#nextpnr-ecp5 --json out.json --write out_pnr.json --45k --lpf pinout.lpf --placed-svg out_placed.svg --routed-svg out_roted.svg --textcfg out.config
nextpnr-ecp5 --json out.json --write out_pnr.json --45k --lpf pinout.lpf --textcfg out.config
ecppack out.config out.bit