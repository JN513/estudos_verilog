module spi_slave (
    input clk,
    input reset,
    output [7:0] rx_data,
    input [7:0] tx_data,

    //spi
    input spi_clk,
    output miso,
    input mosi,
    input cs,
    output rx_done,
    output tx_done
);

reg[3:0] cont, cont_tx;
reg [7:0]rx_data_r, tx_data_r;
reg rx_done_r, tx_done_r, miso_r;

assign rx_done = rx_done_r;
assign tx_done = tx_done_r;
assign miso = miso_r;

initial begin
    cont = 0;
    rx_data_r = 8'b0;
    rx_done_r = 1'b1;
    tx_done_r = 1'b1;
    miso_r = 0;
    cont_tx = 0;
    tx_data_r = 0;
end

always @(posedge spi_clk ) begin
    if(~reset) begin // isso e uma gambiarra por causa do sintetizador
        cont <= 0;
        rx_data_r <= 8'b0;
    end else if(~cs) begin
        if(cont == 0)begin
            rx_done_r <= 0;
            rx_data_r <= {mosi, rx_data_r[7:1]};
            cont <= cont + 1;
        end else if(cont < 8) begin 
            rx_data_r <= {mosi, rx_data_r[7:1]};
            cont <= cont + 1;
            if(cont == 7)
                rx_done_r <= 1;
        end else begin
            cont <= 0;
        end
    end    
end


/* o yosys suporta isso daqui, mas o gowin não, 
    ai fiz a cambiarra de verificar o reset em 2 lugares
always @(negedge reset) begin
    if(~reset) begin
        cont <= 0;
        cont_tx <= 0;
        rx_data_r <= 8'b0;
    end
end
*/
always @(posedge clk ) begin
    if(~reset) begin // isso e uma gambiarra por causa do sintetizador
        cont_tx <= 0;
        miso_r <= 0;
    end else if(~cs) begin
        if(cont_tx == 0)begin
            tx_data_r = tx_data;
            tx_done_r <= 0;
            miso_r <= tx_data_r[7];
            tx_data_r <= {tx_data_r[6:0], 1'b0};
            //miso_r <= 1;
            cont_tx <= cont_tx + 1;
        end else if(cont_tx < 8) begin 
            tx_data_r <= {tx_data_r[6:0], 1'b0};
            miso_r <= tx_data_r[7];
            //miso_r <= 1;
            cont_tx <= cont_tx + 1;
            if(cont_tx == 7) begin
                tx_done_r <= 1;
                cont_tx <= 0;
                miso_r <= 0;
            end 
        end else begin
            cont_tx <= 0;
            miso_r <= 0;
        end
    end   
end

assign rx_data = rx_data_r;
    
endmodule
// pra implementar divisão de clock, precisa organizar envio de acordo com spiclk
