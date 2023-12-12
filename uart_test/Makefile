
all: out.bit

out.bit: out.config
	ecppack out.config out.bit

out.config: out.json
	nextpnr-ecp5 --json out.json --write out_pnr.json --45k --lpf pinout.lpf --textcfg out.config

out.json: top.v pinout.lpf
	yosys -p 'read_verilog top.v; read_verilog uart_rx.v; read_verilog uart_tx.v; synth_ecp5 -json out.json'

clean:
	rm out_pnr.json out.bit out.config out.json

flash: out.bit
	openFPGALoader -b colorlight-i9 out.bit