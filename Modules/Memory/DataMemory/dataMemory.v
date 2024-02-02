`include "../../../define.v"

module dataMemmory(
input logic clk, we,
input logic [WORD_LEN:0] a, wd,
output logic [WORD_LEN:0] rd
);

    logic [WORD_LEN:0] RAM[RAM_DEPTH:0];
    assign rd = RAM[a[WORD_LEN:2]]; 
    
    always_ff @(posedge clk)
        if (we) RAM[a[WORD_LEN:2]] <= wd;

endmodule