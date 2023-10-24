module spi_master (
    input clk,
    input reset,
    output spi_clk, // clk da spi
    output mosi, // master output slave input
    input miso, // master input slave output
    output cs, // chip select
    input [7:0] tx_data, 
    output [7:0] rx_data,
    output tx_done,  // Sinal indicando que a transmissão está concluída
    output rx_done
);

parameter START = 0, WORK = 1, STOP = 2;
reg [1:0] state = STOP; // estados da maquina

reg mosi_r, cs_r, tx_done_r, rx_done_r, clk_r;

//assign spi_clk = clk_r;
assign spi_clk = ~clk;
reg [3:0] cont = 0, cont_rx = 0;
reg [7:0] tx_data_r, rx_data_r;

assign mosi = mosi_r;
assign cs = cs_r;
assign tx_done = tx_done_r;
assign rx_data = rx_data_r;
assign rx_done = rx_done_r;

initial begin
    cs_r = 1;
    tx_done_r = 1;
    rx_done_r = 1;
    mosi_r = 0;
    clk_r = 1;
end

always @(posedge clk) begin
    if (~reset) begin
        state <= START;
        mosi_r <= 1'b0;
        tx_done_r <= 1'b0;
        cs_r <= 1'b1;
        tx_data_r <= tx_data;
    end else begin
        case (state)
            START: begin
                tx_done_r <= 1'b0;
                cs_r <= 1'b0;
                mosi_r <= tx_data_r[7];
                tx_data_r <= {tx_data_r[6:0], 1'b0};
                state <= WORK;
                cont <= 0;
            end
            WORK: begin
                if(cont == 6)
                    state <= STOP;
                tx_data_r <= {tx_data_r[6:0], 1'b0};
                mosi_r <= tx_data_r[7];
                cont <= cont + 1;
            end
            STOP: begin
                tx_done_r <= 1'b1;
                state <= STOP;
                mosi_r <= 1'b0;
                cs_r <= 1'b1;
            end
            default: begin
                state <= STOP;
            end
        endcase // case
    end // reset
end // always

always @(posedge spi_clk ) begin
    if (~reset) begin
        cont_rx <= 0;
    end else if(~cs) begin
        if(cont_rx == 0)begin
            rx_done_r <= 0;
            rx_data_r <= {miso, rx_data_r[7:1]};
            cont_rx <= cont_rx + 1;
        end else if(cont_rx < 8) begin 
            rx_data_r <= {miso, rx_data_r[7:1]};
            cont_rx <= cont_rx + 1;
            if(cont_rx == 7)
                rx_done_r <= 1;
        end else begin
            cont_rx <= 0;
        end
    end   // cs
end // always
    
endmodule
