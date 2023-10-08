module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led
);


parameter CLOCK_COUNTER = 13500000;
parameter BTN_COUNTER = 6750000;

reg [31:0] counter = 'd0;
reg [5:0] led_counter = 'd0;
reg [31:0] btn_counter = 'd0;
reg [31:0] btn_counter2 = 'd0;

always @(posedge clk ) begin
    if(counter < CLOCK_COUNTER) begin
        counter <= counter + 1;
    end
    else begin
        counter <= 0;
        led_counter <= led_counter + 1;
    end

    if(btn1) begin
        if(btn_counter < BTN_COUNTER) begin
            btn_counter <= btn_counter + 1;
        end
        else begin
            btn_counter <= 0;
            led_counter <= 0;
        end
    end
    else begin
        btn_counter <= 0;
    end
end

assign led = ~led_counter;

endmodule
