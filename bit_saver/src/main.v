module top (
    input wire clk,
    input wire btn1,
    output [5:0]led
);

reg [5:0] output_reg = 0;

wire r_out = 0;

OR_gate r(
    .a(btn1),
    .b(r_out),
    .c(r_out)
);

always @(posedge clk) begin
    if(r_out) begin
        output_reg[0] <= 'b1;
    end
    else begin
        output_reg <= 0;
    end
end

assign led = ~output_reg;

endmodule
