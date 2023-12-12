module top (
    input wire clk,
    output wire [7:0]led,
    input wire [0:7]s
);

reg [25:0] counter = 0;
reg [7:0] leds = 0;

always @(posedge clk ) begin
    if(counter < 25000000) begin
        counter <= counter + 1;
    end else begin
        counter <= 0;
        leds <= leds + 1;
    end
end

assign led = s;
    
endmodule