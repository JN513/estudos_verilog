module somador (
    input [7:0]a,
    input [7:0]b,
    input cin,
    output [7:0]s,
    output cout
);

wire c0, c1, c2, c3, c4, c5, c6;

somador_completo u1(
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .cout(c0),
    .s(s[0])
);
somador_completo u2(
    .a(a[1]),
    .b(b[1]),
    .cin(c0),
    .cout(c1),
    .s(s[1])
);
somador_completo u3(
    .a(a[2]),
    .b(b[2]),
    .cin(c1),
    .cout(c2),
    .s(s[2])
);
somador_completo u4(
    .a(a[3]),
    .b(b[3]),
    .cin(c2),
    .cout(c3),
    .s(s[3])
);
somador_completo u5(
    .a(a[4]),
    .b(b[4]),
    .cin(c3),
    .cout(c4),
    .s(s[4])
);
somador_completo u6(
    .a(a[5]),
    .b(b[5]),
    .cin(c4),
    .cout(c5),
    .s(s[5])
);
somador_completo u7(
    .a(a[6]),
    .b(b[6]),
    .cin(c5),
    .cout(c6),
    .s(s[6])
);
somador_completo u8(
    .a(a[7]),
    .b(b[7]),
    .cin(c6),
    .cout(cout),
    .s(s[7])
);

endmodule
