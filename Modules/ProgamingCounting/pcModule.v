`include "../../config/config.v"

module ProgramCounter(
    input clk,            // Clock signal
    input reset,          // Asynchronous reset signal
    input enable,         // Enable signal to increment or load the PC
    input [`WORD_LEN-1:0] newPC,   // Input for loading a new PC value
    output reg [`WORD_LEN-1:0] PC  // Current PC value
);

// On every positive edge of the clock or an active-high reset signal
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Asynchronously reset the PC to 0
        PC <= `WORD_LEN'b0;
    end else if (enable) begin
        // If enabled, increment the PC by 4 (assuming 4-byte instruction width)
        // Alternatively, load a new value into the PC
        PC <= newPC;
    end
end

endmodule
