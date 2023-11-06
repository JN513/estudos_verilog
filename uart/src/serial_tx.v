module serial_tx #(
    parameter NUM_STOP_BITS=1
)
(
    input tick,
    input en,
    input start,
    input [7:0] data_to_send,
    output tx,
    output busy, // ocupado
    output done // transmissão encerrada
);
    
parameter IDLE      = 2'b00;
parameter START_BIT = 2'b01;
parameter DATA_BITS = 2'b10;
parameter STOP_BIT  = 2'b11;

reg [1:0] state = IDLE;
reg [2:0] counter = 3'b0;
reg [7:0] data = 8'b0;

always @(posedge tick ) begin
    case (state)
        IDLE: begin
            tx <= 1'b1;
            done <= 1'b0;
            busy <= 1'b0;
            data <= 8'b0;
            counter <= 3'b0;
            if(start & en) begin
                data <= data_to_send;
                state <= START_BIT;
            end
        end

        START_BIT: begin
            tx <= 1'b0;
            busy <= 1'b1;
            state <= DATA_BITS;
        end

        DATA_BITS: begin
            tx <= data[counter];
            if(&counter) begin
                counter <= 0;
                state <= STOP_BIT;
            end else begin
                counter <= counter + 1;
            end
        end

        STOP_BIT: begin
            done    <= 1'b1;
            data    <= 8'b0;
            state   <= IDLE;
        end

        default: state <= IDLE;
    endcase
end

endmodule
