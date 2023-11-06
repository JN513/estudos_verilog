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


reg [5:0] contador_led = 0;    

reg last_signal_btn1 = 0;
reg last_signal_btn2 = 0;

reg [23:0] repeticoes_signal_btn1 = 0;
reg [23:0] repeticoes_signal_btn2 = 0;

always @(posedge clk) begin
    if(~reset)
        reset <= 1;

    if(repeticoes_signal_btn1 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn1 <= 0;

        contador_led <= contador_led + 1;
        data <= {1'b0, 1'b0, contador_led};
        reset <= 0;
    end

    if(repeticoes_signal_btn2 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn2 <= 0;

        contador_led <= contador_led - 1;
        data <= {1'b0, 1'b0, contador_led};
        reset <= 0;
    end

    if(~btn1) begin // se for na 20 k remova o inverter
        last_signal_btn1 <= 1;
        if(last_signal_btn1) begin
            repeticoes_signal_btn1 <= repeticoes_signal_btn1 + 1;
        end
        else begin
            repeticoes_signal_btn1 <= 0;
        end
    end
    else begin
        last_signal_btn1 <= 0;
    end

    if(~btn2) begin // se for na 20 k remova o inverter
        last_signal_btn2 <= 1;
        if(last_signal_btn2) begin
            repeticoes_signal_btn2 <= repeticoes_signal_btn2 + 1;
        end
        else begin
            repeticoes_signal_btn2 <= 0;
        end
    end
    else begin
        last_signal_btn2 <= 0;
    end
end

//assign led = ~contador_led;

assign led = ~rx_data[5:0];

endmodule
