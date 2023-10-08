module top (
    input clk,
    input btn1,
    input btn2,
    output [5:0]led
);

reg [5:0] out_reg = 0;

wire s_out;
wire r_out;
wire q_out;
wire q_in_out;

AND_gate r_in(
    .a(btn1),
    .b(clk),
    .c(r_out)
);

AND_gate s_in(
    .a(btn2),
    .b(clk),
    .c(s_out)
);

NOR_gate q_gate(
    .a(r_out),
    .b(q_in_out),
    .c(q_out)
);

NOR_gate q_int_gate(
    .a(s_out),
    .b(q_out),
    .c(q_in_out)
);
    
always @(posedge clk ) begin
    if(q_out) begin
        out_reg[0] <= 'b1; 
    end
    else begin
        out_reg[0] <= 'b0; 
    end
    if(q_in_out) begin
        out_reg[5] <= 'b1; 
    end
    else begin
        out_reg[5] <= 'b0; 
    end
end

assign led = ~out_reg;

endmodule
