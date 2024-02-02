`timescale 1ns / 1ps

module imem_tb;

// Declaração de variáveis do testbench
reg [5:0] a;
wire [31:0] rd;

// Instância do módulo imem (Unit Under Test)
imem uut (
    .a(a), 
    .rd(rd)
);

initial begin
    // Inicialização
    a = 0; // Endereço inicial

    // Teste 1: Ler o primeiro endereço
    #10; // Espera um pouco para a simulação
    a = 6'h0; // Ajusta para o primeiro endereço
    #10; // Espera para a leitura

    // Teste 2: Ler um endereço intermediário
    a = 6'h20; // Ajusta para um endereço intermediário
    #10; // Espera para a leitura

    // Teste 3: Ler o último endereço permitido pelo espaço de endereçamento
    a = 6'h3F; // Ajusta para o último endereço
    #10; // Espera para a leitura

    // Conclui a simulação
    $finish;
end

endmodule
