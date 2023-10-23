module spi_slave (
    input clk,
    input reset,
    output [7:0] rx_data,
    input [7:0] tx_data,

    //spi
    input spi_clk,
    output miso,
    input mosi,
    input cs
);

reg[4:0] cont = 0;
reg [7:0]rx_data_r;

initial begin
    rx_data_r = 8'b0;
end

always @(posedge clk ) begin
    if(!cs || cs) begin
        if(cont == 0)begin
            rx_data_r[cont] <= mosi;
            cont <= cont + 1;
        end else if(cont < 8) begin 
            rx_data_r[cont] <= mosi;
            cont <= cont + 1;
        end else if(cont >= 8) begin
            cont <= 0;
        end
    end    
end

assign rx_data = rx_data_r;
    
endmodule
