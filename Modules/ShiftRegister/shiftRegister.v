`include "../../config/config.v"
module shiftreg # (parameter N  8)
(input clk,
input reset, load,
input sin,
input [N1:0] d,
output reg [N1:0] q,
output sout);
    always @ (posedge clk or posedge reset)
        if (reset) q <= 0;
            else if (load) q <= d;
            else q <= {q[N2:0], sin};
        assign sout  q[N1];
endmodule