module top (
    input wire clk,
    //input wire [7:0]s,
    input wire [7:0]btn,
    output wire [7:0]led
);

reg [7:0]leds_reg;
reg [25:0] counter_1, counter_2;

initial begin
    leds_reg = 0;
    counter_1 = 0;
    counter_2 = 0;
end

assign led = ~leds_reg;

always @(posedge clk ) begin
    if(counter_1 == 12500000 ) begin
        leds_reg <= leds_reg + 1;
        counter_1 <= 0;
    end

    if(counter_2 == 12500000 ) begin
        leds_reg <= leds_reg - 1;
        counter_2 <= 0;
    end

    if(btn[0] == 1'b1) begin
        counter_1 <= counter_1 + 1;
    end else begin
        counter_1 <= 0;
    end
    
    if(btn[1] == 1'b1) begin
        counter_2 <= counter_2 + 1;
    end else begin
        counter_2 <= 0;
    end
end

endmodule
