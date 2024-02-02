`include "../../../config/config.v"

module imem(input logic [5:0] a,
output logic [WORD_LEN:0] rd);
logic [WORD_LEN:0] RAM[RAM_DEPTH:0];

    initial
    //read file and store in RAM
    $readmemh("memfile.dat", RAM);
    assign rd = RAM[a]; // word aligned

endmodule