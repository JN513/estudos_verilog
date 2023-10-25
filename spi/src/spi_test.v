module test();

always #1 clk=~clk;

reg clk, reset = 1, reset_slave = 1;

wire mosi, sclk, cs, tx_d, rx_d, miso, slave_d, slave_tx_d;

reg [7:0] data = 8'b10110111, data_slave = 8'b10101101;
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

spi_slave u2(
    .clk(clk),
    .reset(reset_slave),
    .spi_clk(sclk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .rx_data(rx_data),
    .rx_done(slave_d),
    .tx_done(slave_tx_d),
    .tx_data(data_slave)
);

initial begin
    clk = 0;
    $dumpfile("spi.vcd");
    $dumpvars;

    $display("RX data %d", rx_data);
    $display("TX slave data %b", data_slave);

    #1
    reset = 0;
    reset_slave = 0;

    #2
    reset = 1;
    reset_slave = 1;

    #40

    $display("TX Done %b", slave_tx_d);
    $display("RX Done %b", slave_d);
    $display("RX data %b", rx_data);
    $display("RX data master %b", rx_master_data);

    $display("");

    $display("Segundo round");

    data = 8'b11111011;
    data_slave = 8'b10001001;

    $display("TX master %b", data);
    $display("TX slave data %b", data_slave);

    $display("");

    $display("RX master %b", rx_master_data);
    $display("RX slave data %b", rx_data);

    $display("");

    #2

    //reset_slave = 0;
    reset = 0;

    #2

    reset = 1;
    //reset_slave = 1;

    #40

    $display("TX master %b", data);
    $display("TX slave data %b", data_slave);

    $display("");

    $display("RX master %b", rx_master_data);
    $display("RX slave data %b", rx_data);

    $finish;

end

endmodule
