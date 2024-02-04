`include "../../../config/config.v"

module dataMemory(
input  clk, we,
input  [`WORD_LEN-1:0] a, wd,
output  [`WORD_LEN-1:0] rd
);

    reg [`WORD_LEN-1:0] RAM[`RAM_DEPTH-1:0];
    
    assign rd = RAM[a[`WORD_LEN-1:2]]; 

    always @(posedge clk)
        if (we) RAM[a[`WORD_LEN-1:2]] <= wd;

endmodule

