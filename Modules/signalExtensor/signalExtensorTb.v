`include "../../config/config.v"

`timescale 1ns / 1ps
module siganalNext_tb;

// Sinais do Testbench
reg [`SIGN_EXTEND_LEN-1:0] inputSignalBeforeExtension;
wire [`WORD_LEN-1:0] outputSignalAfterExtension;

// Instanciação do módulo a ser testado
siganalNext uut (
    .inputSignalBeforeExtension(inputSignalBeforeExtension),
    .outputSignalAfterExtension(outputSignalAfterExtension)
);

initial begin

    // Inicialização
    inputSignalBeforeExtension = 0;
    
    $dumpfile("siganalNext_tb.vcd");
    $dumpvars(0, siganalNext_tb);

    // Aplicação de estímulos
    #10 inputSignalBeforeExtension = 16'h8000; // Teste com bit MSB = 1
    #10 inputSignalBeforeExtension = 16'h7FFF; // Teste com bit MSB = 0

    #20 $finish; // Finaliza a simulação
end

initial begin
    $monitor("At time %t, input = %h, output = %h",
             $time, inputSignalBeforeExtension, outputSignalAfterExtension);
end

endmodule
