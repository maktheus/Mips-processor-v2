`include "../../../config/config.v"

module instructionMemory(input  [`MEMORY_ADDR_LEN-1:0] a,
output  [`WORD_LEN-1:0] rd);

reg [`WORD_LEN-1:0] RAM[`RAM_DEPTH-1:0];

    initial
    //read file and store in RAM
    begin
        $readmemh("../../../memfile.dat", RAM);
    end
    
    assign rd = RAM[a]; // word aligned

endmodule