module spi_master (
    input clk,
    input reset,
    output spi_clk, // clk da spi
    output mosi, // master output slave input
    input miso, // master input slave output
    output cs, // chip select
    input [7:0] tx_data, 
    output [7:0] rx_data,
    input start_tx, // Sinal para iniciar a transmissão
    output tx_done,  // Sinal indicando que a transmissão está concluída
    output rx_done
);

reg [3:0] state; // estados da maquina

reg sclk, mosi_r, cs_r, tx_done_r, trig;

assign spi_clk = clk;
assign mosi = mosi_r;
assign cs = cs_r;
assign tx_done = tx_done_r;

parameter START = 0, S0 = 1, S1 = 2, S2 = 3, S3 = 4, S4 = 5, S5 = 6, S6 = 7, S7 = 8, STOP = 9;

always @(posedge clk) begin
    if(start_tx == 1'b1) begin
        if (reset == 1'b1) begin
            state <= START;
            sclk <= 1'b0;
            mosi_r <= 1'b0;
            tx_done_r <= 1'b0;
            cs_r <= 1'b1;
        end else begin
            case (state)
                START: begin
                    tx_done_r <= 1'b0;
                    state <= S0;
                    trig <= 1'b1;
                    sclk <= 1'b0;
                    mosi_r <= 1'b0;
                    cs_r <= 1'b0;
                end
                S0: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[7];
                        trig <= 1'b0;
                    end else begin
                        state <= S1;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S1: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[6];
                        trig <= 1'b0;
                    end else begin
                        state <= S2;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S2: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[5];
                        trig <= 1'b0;
                    end else begin
                        state <= S3;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end 
                S3: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[4];
                        trig <= 1'b0;
                    end else begin
                        state <= S4;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S4: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[3];
                        trig <= 1'b0;
                    end else begin
                        state <= S5;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S5: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[2];
                        trig <= 1'b0;
                    end else begin
                        state <= S6;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S6: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[1];
                        trig <= 1'b0;
                    end else begin
                        state <= S7;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                S7: begin
                    if(trig == 1'b1) begin
                        sclk <= 'b1;
                        mosi_r <= tx_data[0];
                        trig <= 1'b0;
                    end else begin
                        state <= STOP;
                        sclk <= 1'b0;
                        trig <= 1'b1;
                    end
                end
                STOP: begin
                    tx_done_r <= 1'b1;
                    state <= STOP;
                    sclk <= 1'b0;
                    mosi_r <= 1'b0;
                    cs_r <= 1'b1;
                end
                default: begin
                    state <= STOP;
                end
            endcase // case
        end // reset
    end // enable
end // always
    
endmodule