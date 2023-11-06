module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led
);

parameter NUM_CLOCKS_CLICK = 6750000;

reg reset = 1, reset_slave = 1;

wire mosi, sclk, cs, tx_d, rx_d, miso, slave_d, slave_tx_d;

reg [7:0] data = 8'b00000000, data_slave = 8'b10101101;
wire [7:0] rx_data, rx_master_data;

spi_master u1(
    .clk(clk),
    .reset(reset),
    .spi_clk(sclk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .tx_done(tx_d),
    .rx_done(rx_d),
    .tx_data(data),
    .rx_data(rx_master_data)
);


endmodule
