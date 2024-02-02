module alu (
    input [`WORD_LEN-1:0] a,    // First operand
    input [`WORD_LEN-1:0] b,    // Second operand
    input [`EXE_CMD_LEN:0] alucontrol, // ALU control signal
    output reg [`WORD_LEN-1:0] result, // Result of operation
    output reg zero        // Zero flag as a reg type
);

    always @(*)
    begin
        case(alucontrol)
            4'b0010: result = a + b;           // ADD
            4'b0110: result = a - b;           // SUBTRACT
            4'b0000: result = a & b;           // AND
            4'b0001: result = a | b;           // OR
            4'b0111: result = a < b ? 1 : 0;   // SET LESS THAN
            4'b1100: result = a ^ b;           // XOR
            4'b1101: result = ~(a | b);        // NOR
            4'b1000: result = a << b;          // SHIFT LEFT ARITHMETIC
            4'b1001: result = a <<< b;         // SHIFT LEFT LOGICAL
            4'b1010: result = a >> b;          // SHIFT RIGHT ARITHMETIC
            4'b1011: result = a >>> b;         // SHIFT RIGHT LOGICAL

            default: result = 0;              // DEFAULT CASE
        endcase

        // Set the zero flag if result is zero
        zero = (result == 0);
    end

endmodule

