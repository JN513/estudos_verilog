module spi_slave (
    input wire reset,
    input wire clk,
    output wire spi_clk, // clk da spi
    input wire mosi, // master output slave input
    output wire miso, // master input slave output
    input wire cs, // chip select
    input [7:0] input_data, 
    output [7:0] output_data
);

reg [7:0] shift_register, data;
reg shift_enable;

reg [5:0] counter = 0;

always @(posedge clk) begin
  if (!reset) begin
    shift_register <= 8'b0;
    shift_enable <= 1'b0;
  end else begin
    if (!spi_clk) begin
      counter <= counter + 1;
      if(counter == 8) begin
           data <= shift_register;
           counter <= 0;
      end

      // Se o sinal SCLK estiver ativo, fazemos a captura do dado do mestre
      shift_register <= {mosi, shift_register[7:1]}; // Shift in dados do mestre
      shift_enable <= 1'b1;
    end else begin
      shift_enable <= 1'b0;
    end
  end
end

//assign miso = shift_enable ? shift_register[7] : 1'b0; // MISO é o bit mais significativo do registrador de deslocamento
assign output_data = data;
    
endmodule
