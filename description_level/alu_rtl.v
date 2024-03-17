module Alu (
    input wire [3:0] operation,
    input wire [31:0] ALU_in_X,
    input wire [31:0] ALU_in_Y,
    output reg [31:0] ALU_out_S,
    output wire ZR
);

localparam AND           = 4'b0000;
localparam OR            = 4'b0001;
localparam SUM           = 4'b0010;
localparam SUB           = 4'b0110;

assign ZR = ~( |ALU_out_S );

always @(*) begin
    case(operation)
        AND: // AND
            ALU_out_S = ALU_in_X & ALU_in_Y ; 
        OR: // OR
            ALU_out_S = ALU_in_X | ALU_in_Y ;
        SUM: // Adição
            ALU_out_S = ALU_in_X + ALU_in_Y;
        SUB: // Subtração
            ALU_out_S = ALU_in_X - ALU_in_Y;
        default: ALU_out_S = ALU_in_X ; // Operação padrão
    endcase
end
    
endmodule
