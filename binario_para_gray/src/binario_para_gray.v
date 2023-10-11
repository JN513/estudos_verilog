module binario_para_gray (
    input [7:0] a,
    output [7:0] b
);

assign b[7] = a[7];
assign b[6] = a[7] ^ a[6];
assign b[5] = a[6] ^ a[5];
assign b[4] = a[5] ^ a[4];
assign b[3] = a[4] ^ a[3];
assign b[2] = a[3] ^ a[2];
assign b[1] = a[2] ^ a[1];
assign b[0] = a[1] ^ a[0];

endmodule
