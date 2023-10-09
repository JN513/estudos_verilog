module spi_master (
    input clk,
    output spi_clk, // clk da spi
    output mosi, // master output slave input
    input miso, // master input slave output
    output cs, // chip select
    input [7:0] tx_data, 
    output [7:0] rx_data,
    input start_tx, // Sinal para iniciar a transmissão
    output tx_done  // Sinal indicando que a transmissão está concluída
);

localparam INICIA_TRANSMISSAO = 3'b000;

reg [2:0] state; // Registrador que armazena o estado atual da maquina de estado
reg idle;

initial begin
    idle = 1;
end

always @(posedge clk ) begin
    if(start_tx && idle) begin
        state <= 3'b000;  // Inicializa a máquina de estados
        cs <= 'b0; // Ativa o seletor de chip movendo o estado dele para baixo
        tx_done <= 'b0;
    end
    else if(!idle) begin
        case(state)
            3'b000: begin
                state <= 3'b000;  // Inicializa a máquina de estados
                cs_n <= 1'b1;  // Desativa o chip select para iniciar a transmissão
                state <= 3'b001;
            end
            3'b001: begin
                // Aguarda um ciclo de clock antes de começar a transmitir
                state <= 3'b010;
            end
            3'b010: begin
                sck <= sck_div; // Gera o sinal de clock serial
                mosi <= tx_data[7]; // Transmite o bit mais significativo
                state <= 3'b011;
            end
            3'b011: begin
                // Aguarda um ciclo de clock antes de mover para o próximo bit
                state <= 3'b100;
            end
            3'b100: begin
                sck <= sck_div; // Gera o sinal de clock serial
                mosi <= tx_data[6:0]; // Transmite os bits restantes
                state <= 3'b101;
            end
            3'b101: begin
                // Aguarda um ciclo de clock antes de concluir a transmissão
                state <= 3'b110;
            end
            3'b110: begin
                cs_n <= 1'b0;    // Desativa o chip select para encerrar a transmissão
                tx_done <= 1'b1; // Sinaliza que a transmissão está concluída
                state <= 3'b111;
                idle <= 'b1;
            end
            3'b111: begin
                // Aguarda um ciclo de clock antes de voltar ao estado inicial
                state <= 3'b000;
            end
            default: state <= 3'b000;
        endcase
    end
end

always @(posedge clk) begin
    if (state == 3'b010 || state == 3'b100) begin
      tx_data <= {tx_data[6:0], 1'b0}; // Desloca os dados de transmissão para a esquerda
    end
end
    
endmodule
