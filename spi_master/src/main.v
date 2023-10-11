module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led,
    output spi_clk, // clk da spi
    output mosi, // master output slave input
    input miso, // master input slave output
    output cs // chip select
);


localparam NUM_CLOCKS_CLICK = 6750000;
reg [5:0] contador_led = 0;    

reg [0:0] last_signal_btn1 = 0;
reg [0:0] last_signal_btn2 = 0;

reg [23:0] repeticoes_signal_btn1 = 0;
reg [23:0] repeticoes_signal_btn2 = 0;
reg [7:0] data;

reg start;
reg reset_r;
wire txdone;

initial begin
    reset_r = 0;
end

spi_master my_spi(
    .clk(clk),
    .reset(reset_r),
    .spi_clk(spi_clk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .tx_data(data),
    .start_tx(start),
    .tx_done(txdone)
);

always @(posedge clk ) begin
    start <= 0;
    reset_r <= 1;
    if(repeticoes_signal_btn1 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn1 <= 0;

        contador_led <= contador_led + 1;

        data <= {0,0, contador_led[5:0]};

        start <= 1;
    end

    if(repeticoes_signal_btn2 == NUM_CLOCKS_CLICK) begin
        repeticoes_signal_btn2 <= 0;

        reset_r <= 0;
    end

    if(btn1) begin
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

    if(btn2) begin
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
    
assign led = ~contador_led;

endmodule
