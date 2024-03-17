module top (
    input wire CLK100MHZ,
    input wire [3:0]btn,
    output wire [3:0] led
);

reg [4:0] counter_leds;
reg [31:0] counter;

initial begin
    counter = 32'h00000000;
    counter_leds = 4'h00;
end

always @(posedge CLK100MHZ ) begin
    if( btn[0] == 1'b1 )begin
        counter <= 32'h00000000;
        counter_leds <= 4'h00;
    end else begin
        if(counter == 32'd50000000) begin
            counter_leds <= counter_leds + 1'b1;
            counter <= counter <= 32'h00000000;
        end else begin
            counter <= counter + 1'b1;
        end
    end
end

assign led = counter_leds;
    
endmodule