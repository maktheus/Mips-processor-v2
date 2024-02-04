`include "../../../config/config.v"
`timescale 1ns / 1ps

module instructionMemory_tb;

// Declaração de variáveis do testbench
reg [`MEMORY_ADDR_LEN-1:0] a;
wire [`WORD_LEN-1:0] rd;

// Instância do módulo imem (Unit Under Test)
instructionMemory uut (
    .a(a), 
    .rd(rd)
);

initial begin
    // Inicialização
    a = 0; // Endereço inicial
        $dumpfile("instructionMemory_tb.vcd");
        $dumpvars(0, instructionMemory_tb);

    // Teste 1: Ler o primeiro endereço
    #10; // Espera um pouco para a simulação
    a = 6'h0; // Ajusta para o primeiro endereço
    #10; // Espera para a leitura
    if (rd !== 32'h20020005) $display("Test failed for read address 0");
    else $display("Test passed for read address 0");

    // Teste 2: 
    #10; // Espera um pouco para a simulação
    a = 6'd2; // Ajusta para o último endereço
    #10; // Espera para a leitura
    if (rd !== 32'h2067fff7) $display("Test failed for read address 2");
    else $display("Test passed for read address 2");

    // Teste 3:
    #10; // Espera um pouco para a simulação
    a = 6'd3; // Ajusta para o último endereço
    #10; // Espera para a leitura
    if (rd !== 32'h00e22025) $display("Test failed for read address 3");
    else $display("Test passed for read address 3");

    // Fim da simulação

    $finish;
end

endmodule

// memodry adress for test
// 20020005
// 2003000c
// 2067fff7
// 00e22025
// 00642824
// 00a42820
// 10a7000a
// 0064202a
// 10800001
// 20050000
// 00e2202a
// 00853820
// 00e23822
// ac670044
// 8c020050
// 08000011
// 20020001
// ac020054