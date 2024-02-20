`timescale 1ns / 1ps

module shiftreg_tb;

    // Parâmetros do Testbench
    parameter N = `SHIFT_LEN; 
    parameter CLK_PERIOD = 10; // Período do clock em ns

    // Entradas
    reg clk;
    reg reset;
    reg load;
    reg sin;
    reg [N-1:0] data_in;

    // Saídas
    wire [N-1:0] data_out;
    wire sout;

    // Variáveis do Testbench
    reg [N-1:0] expected_data_out; // Declarada aqui para uso no bloco initial

    // Instância do módulo a ser testado
    shiftreg #(.N(N)) uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .sin(sin),
        .data_in(data_in),
        .data_out(data_out),
        .sout(sout)
    );

    // Geração de clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Procedimento inicial
    initial begin
        // Inicialização
        clk = 0;
        reset = 1;
        load = 0;
        sin = 0;
        data_in = 0;
               $dumpfile("shiftreg_tb.vcd");
        $dumpvars(0, shiftreg_tb);
        // Reset do sistema
        #20;
        reset = 0;

        // Teste de carga de dados
        #10;
        load = 1;
        data_in = 8'b10101010; // Exemplo de padrão de dados
        #10;
        load = 0;

        // print data_out
        $display("data_out = %b", data_out);

        // Teste de deslocamento com sin = 1
        #20;
        sin = 1;
        #10;
        sin = 0;
        // print data_out
        $display("data_out = %b", data_out);

        // Mais ciclos de clock para observação
        #100;

        // Preparação do valor esperado
        expected_data_out = {data_in[N-2:0], 1'b1}; // Prepara o valor esperado antes da verificação



        // Finaliza a simulação
        $finish;
    end

endmodule
