module regfile (input clk,
    input we3,
    input [`RA_LEN] ra1, ra2, wa3,
    input [`WORD_LEN-1:0] wd3,
    output [`WORD_LEN-1:0] rd1, rd2);
    reg [`WORD_LEN-1:0] rf[`WORD_LEN-1:0];
    always @ (posedge clk)
    if (we3) rf[wa3] <= wd3;
    assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
endmodule