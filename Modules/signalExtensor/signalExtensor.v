module siganalNext(
    input  [`SIGN_EXTEND_LEN-1:0] inputSignalBeforeExtension,
    output  [`WORD_LEN-1:0] outputSignalAfterExtension);

    // Estender o sinal do bit mais significativo (bit 15) da entrada de 16 bits
    // e concatenar com a entrada original para criar uma saída de 32 bits.
    assign outputSignalAfterExtension = {{`SIGN_EXTEND_LEN{inputSignalBeforeExtension[`SIGN_EXTEND_LEN-1]}}, inputSignalBeforeExtension};

endmodule