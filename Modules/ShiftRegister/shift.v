module sl2 (input [31:0] a,
output [31:0] y);
// shift left by 2
assign y = {a[29:01], 2'b00};
endmodule
