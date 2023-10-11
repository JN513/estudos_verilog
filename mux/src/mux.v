module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led,
    input a,
    input b,
    input s,
    output c
);


reg [5:0] led_reg = 0;
reg out;

always @( a or b or s ) begin
    out = (~s & a) | (s & b);
end
    
assign led = ~led_reg;
assign c = out;

endmodule
