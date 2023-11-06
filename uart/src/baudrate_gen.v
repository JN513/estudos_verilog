module baudrate_gen #(
    parameter BAUDRATE = 115200,
    parameter CLK = 27000000,
    parameter CLK_TO_TICK = CLK / BAUDRATE
) (
    input clk,
    input rst,
    output tick
);

reg tick_r = 0;
reg [8:0] counter = 0;

assign tick = tick_r;

always @(posedge clk) begin
    if(counter == CLK_TO_TICK) begin
        tick_r <= ~tick_r;
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end
    
endmodule
