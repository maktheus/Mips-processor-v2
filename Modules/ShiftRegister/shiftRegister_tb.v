`include "../../config/config.v"
`timescale 1ns / 1ps

module shift_register_tb;

// Parâmetros do Test Bench
reg clk;
reg reset;
reg [7:0] data_in;
reg shift_en;
wire [7:0] data_out;

// Instanciação do módulo do registrador de deslocamento
// Substitua "shift_register" pelo nome real do seu módulo
shift_register uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .shift_en(shift_en),
    .data_out(data_out)
);

// Geração de clock para simulação
always #10 clk = ~clk;

// Inicialização e simulação de cenários de teste
initial begin
    // Inicializa o clock e o reset
    clk = 0;
    reset = 1;
    shift_en = 0;
    data_in = 8'b00000000;

    // Reset do sistema
    #20;
    reset = 0;
    
    // Teste 1: Deslocamento com o enable desativado
    #20;
    data_in = 8'b10101010;
    shift_en = 0;
    
    // Teste 2: Ativa o deslocamento
    #20;
    shift_en = 1;
    
    // Teste 3: Continua o deslocamento com novos dados
    #40;
    data_in = 8'b11001100;
    
    // Conclusão dos testes
    #100;
    $finish;
end

endmodule
