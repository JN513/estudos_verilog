module tb_pwm();
reg clk;
reg rst_n;

pwm u1(
    .rst (rst_n),
    .clk (clk),
    .compare(8'b1000000)
);

always #1 clk=~clk;

initial begin
    $dumpfile("pwm.vcd");
    $dumpvars;

    clk = 0;

    $display("iniciando");

    #4 rst_n<=0;
    #4 rst_n<=1;clk<=0;

    #1000000
    $finish;
end

endmodule
