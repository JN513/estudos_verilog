module serial_rx #(
    parameter NUM_STOP_BITS=1
)(
    input tick, // clk da uart
    input rx,
    input en, // habilita o periferico
    output [7:0] data_received,
    output busy, // ocupado
    output done, // dados recebidos
    output err
);

parameter RESET     = 2'b00;
parameter IDLE      = 2'b01;
parameter DATA_BITS = 2'b10;
parameter STOP_BIT  = 2'b11;

reg [1:0] state = IDLE;
reg [2:0] bitIdx = 3'b0; // para contar até 8
reg [1:0] inputSw = 2'b0; // shift reg for input signal state
reg [3:0] clockCount = 4'b0; // count clocks for 16x oversample

reg [7:0] receivedData = 8'b0; // temporary storage for input data

initial begin
    data_received <= 8'b0;
    err <= 1'b0;
    done <= 1'b0;
    busy <= 1'b0;
end

always @(posedge tick ) begin
    inputSw = { inputSw[0], in };

    if (!en) begin
        state = RESET;
    end


    case (state)
        RESET: begin
            data_received <= 8'b0;
            err <= 1'b0;
            done <= 1'b0;
            busy <= 1'b0;
            bitIdx <= 3'b0;
            clockCount <= 4'b0;
            receivedData <= 8'b0;
            if (en) begin
                state <= IDLE;
            end
        end

        IDLE: begin
            done <= 1'b0;
            if (&clockCount) begin
                state <= DATA_BITS;
                out <= 8'b0;
                bitIdx <= 3'b0;
                clockCount <= 4'b0;
                receivedData <= 8'b0;
                busy <= 1'b1;
                err <= 1'b0;
            end else if (!(&inputSw) || |clockCount) begin
                // Check bit to make sure it's still low
                if (&inputSw) begin
                    err <= 1'b1;
                    state <= RESET;
                end
                clockCount <= clockCount + 4'b1;
            end
        end

        DATA_BITS: begin
            if (&clockCount) begin // save one bit of received data
                clockCount <= 4'b0;
                // TODO: check the most popular value
                receivedData[bitIdx] <= inputSw[0];
                if (&bitIdx) begin
                    bitIdx <= 3'b0;
                    state <= STOP_BIT;
                end else begin
                    bitIdx <= bitIdx + 3'b1;
                end
            end else begin
                clockCount <= clockCount + 4'b1;
            end
        end

        STOP_BIT: begin
            if (&clockCount || (clockCount >= 4'h8 && !(|inputSw))) begin
                state <= IDLE;
                done <= 1'b1;
                busy <= 1'b0;
                data_received <= receivedData;
                clockCount <= 4'b0;
            end else begin
                clockCount <= clockCount + 1;
                // Check bit to make sure it's still high
                if (!(|inputSw)) begin
                    err <= 1'b1;
                    state <= RESET;
                end
            end
        end

        default: state <= IDLE;
    endcase
end
    
endmodule
