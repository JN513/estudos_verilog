
all: build/out.bit

build/out.bit: build/out.config
	ecppack build/out.config build/out.bit

build/out.config: build/out.json
	nextpnr-ecp5 --json build/out.json --write build/out_pnr.json --45k --lpf pinout.lpf --textcfg build/out.config --package CABGA381

build/out.json: top.v pinout.lpf buildFolder
	yosys -p 'read_verilog top.v; synth_ecp5 -json build/out.json'

buildFolder:
	mkdir -p build

clean:
	rm out_pnr.json out.bit out.config out.json

flash:
	openFPGALoader -b colorlight-i9 build/out.bit