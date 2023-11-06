module top(
    input clk,
    output led[5:0],
    input btn1,
    input btn2
);

parameter NUM_TICK_1S = 27000000;

reg [7:0] duty;
reg [32:0] contador;
reg reset_r;
wire pwm;

pwm u1(
    .rst (reset_r),
    .clk (clk),
    .compare(duty),
    .pwm(pwm)
);

initial begin
    duty = 0;
end

always @(posedge clk ) begin
    if(reset_r == 0) begin 
        reset_r <= 1;
    end

    if(contador == NUM_TICK_1S) begin
        contador <= 0;
        duty <= duty + 10;
        reset_r <= 0;
    end else begin
        contador <= contador + 1;
    end
end

assign led[0] = ~pwm;
assign led[1] = ~pwm;
assign led[2] = ~pwm;
assign led[3] = ~pwm;
assign led[4] = ~pwm;
assign led[5] = ~pwm;

endmodule
