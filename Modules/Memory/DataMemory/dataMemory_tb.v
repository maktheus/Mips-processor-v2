`include "../../../config/config.v"

`timescale 1ns / 1ps

module dataMemory_tb;

// Inputs
reg clk, we;
reg [`WORD_LEN-1:0] a, wd;
wire [`WORD_LEN-1:0] rd;

// Instantiate the Unit Under Test (UUT)
dataMemory uut (
    .clk(clk),
    .we(we),
    .a(a),
    .wd(wd),
    .rd(rd)
);

initial begin
    // Initialize Inputs
    clk = 0;
    we = 0;
    a = 0;
    wd = 0;

    // Start VCD dump
    $dumpfile("dataMemory_tb.vcd");
    $dumpvars(0, dataMemory_tb);

    // Wait for global reset
    #100;
    
    // Write cycle
    we = 1; // Enable write
    a = 4;  // Set address
    wd = 32'hdeadbeef; // Set write data
    #10; // Wait a bit
    we = 0; // Disable write for read cycle
    
    #10;
    
    // Read cycle
    a = 4;  // Set address to read
    // Note: rd should be updated at the next positive edge of clk
    
    // Wait for the next positive edge of clk
    #10;

    // Check if the read data is correct
    if (rd !== 32'hdeadbeef) $display("Test failed for write/read register 5");
    else $display("Test passed for write/read register 5");

    // End simulation
    $finish;
end

// Generate clock with period of 10 time units
always #5 clk = ~clk;

endmodule
