module decoder_2_to_4 (
    input a,
    input b,
    output [3:0] c
);

assign c[3] = (!a) & (!b);
assign c[2] = a & (!b);
assign c[1] = b & (!a);
assign c[0] = a & b;

endmodule
