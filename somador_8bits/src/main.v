module top (
    input clk,
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] leds
);

reg [7:0]out;

somador s1(
    .a(num1),
    .b(num2),
    .s(out)
);

assign leds = out;
    
endmodule
