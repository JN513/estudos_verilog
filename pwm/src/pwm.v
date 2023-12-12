module pwm #(
    parameter CLK_NUM = 27000000,
    parameter PRECISION = 8, // maxima e 9 bits
    parameter PWM_CLK = 980,
    parameter CLK_DIV_COUNTER = CLK_NUM / (PWM_CLK * (2 ** PRECISION ))
)(
    input clk,
    input rst,
    input [PRECISION - 1 : 0] compare,
    output pwm
);

reg pwm_r;
reg [PRECISION - 1: 0]counter;
reg [PRECISION:0] clk_counter;

assign pwm = pwm_r;

initial begin
    pwm_r = 0;
    counter = 0;
    clk_counter <= 0;
end

always @(posedge clk or negedge rst) begin
    if(~rst) begin
        clk_counter <= 0;
        counter <= 0;
        pwm_r <= 0;
    end else begin
        if(clk_counter == CLK_DIV_COUNTER) begin
            counter <= counter + 1;
        end else begin
            clk_counter <= clk_counter + 1;
        end

        if(counter == compare) begin
            pwm_r <= 0;
        end else if(counter == 0) begin
            pwm_r <= 1;
        end
    end
end
    
endmodule