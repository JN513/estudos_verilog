module somador_completo (
    input a,
    input b,
    input cin,
    output s,
    output cout
);

wire c, s1, c1;

meio_somador meio1(
    .a(a),
    .b(b),
    .s(s1),
    .c(c)
);

meio_somador meio2(
    .a(s1),
    .b(cin),
    .s(s),
    .c(c1)
);

assign cout = c | c1;

endmodule
