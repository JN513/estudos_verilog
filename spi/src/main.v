module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led
);

parameter NUM_CLOCKS_CLICK = 13500000;

reg [7:0] data = 8'b0, rx_data, rx_data2;
reg reset = 1'b0, start = 1'b0, tx_d, rx_d;

wire mosi;
wire cs;
wire sclk;
wire miso;

spi_master m1(
    .clk(clk),
    .mosi(mosi),
    .tx_data(data),
    .cs(cs),
    .spi_clk(sclk),
    .start_tx(start),
    .reset(reset),
    .miso(miso),
    .rx_data(rx_data),
    .tx_done(tx_d),
    .rx_done(rx_d)
);

wire r_sla;

spi_slave u1(
    .clk(clk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .reset(r_sla),
    .rx_data(rx_data2),
    .tx_data(data)
);


reg [5:0] contador_led = 0;    

reg [0:0] last_signal_btn1 = 0;
reg [0:0] last_signal_btn2 = 0;

reg [32:0] repeticoes_signal_btn1 = 0;
reg [32:0] repeticoes_signal_btn2 = 0;

always @(posedge clk) begin
    if(tx_d) begin
        start <= 0;
    end

    if(repeticoes_signal_btn1 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn1 <= 0;

        contador_led <= contador_led + 1;
        data <= data + 1;
        start <= 1;
    end

    if(repeticoes_signal_btn2 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn2 <= 0;

        contador_led <= contador_led - 1;
        data <= data - 1;
        start <= 1;
    end

    if(~btn1) begin
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

    if(~btn2) begin
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

assign led = ~rx_data2[5:0];

endmodule
