module spi_master (
    input clk,
    input reset,
    output spi_clk, // clk da spi
    output mosi, // master output slave input
    input miso, // master input slave output
    output cs, // chip select
    input [5:0] tx_data, 
    output [5:0] rx_data,
    input start_tx, // Sinal para iniciar a transmissão
    output tx_done,  // Sinal indicando que a transmissão está concluída
    output rx_done
);

localparam IDLE = 3'b000;
localparam SENDING = 3'b001;
localparam RECEIVING = 3'b010;

reg [2:0] state; // Registrador que armazena o estado atual da maquina de estado
reg [5:0] bit_counter;
reg [5:0] spi_data, output_data;

reg sck, mosi_r, tx_done_r, rx_done_r, cs_r;

initial begin
    state = IDLE;
    bit_counter = 0;
end;

assign rx_data = output_data;
assign spi_clk = sck;
assign mosi = mosi_r;
assign tx_done = tx_done_r;
assign rx_done = rx_done_r;
assign cs = cs_r;

always @(posedge clk or negedge reset ) begin
    if(!reset) begin 
        sck <= 0;
        spi_data <= 6'h00;
        mosi_r <= 0;
        state <= IDLE;
        tx_done_r <= 0;
        rx_done_r <= 0;
        output_data <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                sck <= 0;

                if(start_tx) begin
                    spi_data <= tx_data;
                    state <= SENDING;
                end
            end

            SENDING: begin
                sck <= ~clk;
                if(bit_counter == 0) begin
                    cs_r <= 0;
                    mosi_r <= spi_data[5];
                    spi_data <= {spi_data[4:0], 1'b1};
                end else if(bit_counter == 6) begin
                    cs_r <= 1;
                    bit_counter <= 0;
                    tx_done_r <= 1;
                    state <= IDLE;
                end else begin
                    mosi_r <= spi_data[5];
                    spi_data <= {spi_data[4:0], 1'b1};
                    bit_counter <= bit_counter + 1;
                end
            end

            RECEIVING: begin
                sck <= ~clk;
                if(bit_counter == 0) begin
                    cs_r <= 0;
                    output_data[5] <= miso;
                end else if(bit_counter == 6) begin
                    cs_r <= 1;
                    bit_counter <= 0;
                    rx_done_r <= 1;
                    state <= IDLE;
                end else begin
                    output_data <= {1'b1, output_data[5:1]};
                    output_data[5] <= miso;
                    bit_counter <= bit_counter + 1;
                end
            end
        endcase
    end
end
    
endmodule
