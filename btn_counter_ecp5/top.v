module top (
    input wire clk,
    input wire btn,
    output wire [7:0]led
);

reg [7:0]leds_reg;
reg [25:0] counter;

initial begin
    leds_reg = 0;
    counter = 0;
end

assign led = ~leds_reg;

always @(posedge clk ) begin
    if(counter == 12500000 ) begin
        leds_reg <= leds_reg + 1;
        counter <= 0;
    end


    if(btn == 1'b1) begin
        counter <= counter + 1;
    end else begin
        counter <= 0;
    end
end

endmodule
