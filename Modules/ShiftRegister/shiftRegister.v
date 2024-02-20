`include "../../config/config.v"

module shiftreg # (parameter N = `SHIFT_LEN) // Corrige para usar `SHIFT_LEN` como valor padrão para N
   (input clk,
    input reset, load,
    input sin,
    input [N-1:0] data_in,
    output reg [N-1:0] data_out,
    output sout);

    always @(posedge clk or posedge reset)
        if (reset)
            data_out <= 0;
        else if (load)
            data_out <= data_in;
        else
            data_out <= {data_out[N-2:0], sin}; // Desloca e insere `sin` na posição menos significativa

    assign sout = data_out[N-1]; // Corrigido para usar `N-1` para o bit mais significativo

endmodule
