module top (
    input wire clk,
    input btn1,
    input btn2,
    output [5:0]led,
    input spi_clk, // clk da spi
    input mosi, // master output slave input
    output miso, // master input slave output
    input cs // chip select
);

wire [7:0] spi_rx;
reg reset_r = 1;
    
spi_slave my_spi(
    .reset(reset_r),
    .clk(clk),
    .spi_clk(spi_clk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .output_data(spi_rx)
);

assign led = ~spi_rx[5:0];

endmodule
