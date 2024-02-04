`include "../../../config/config.v"
`timescale 1ns / 1ps

module ProgramCounter_tb;

// Inputs
reg clk;
reg reset;
reg enable;
reg [31:0] newPC;

// Output
wire [31:0] PC;

// Instantiate the Unit Under Test (UUT)
ProgramCounter uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .newPC(newPC),
    .PC(PC)
);

// Clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk; // Toggle clock every 10 ns
end

// Test cases
initial begin
    // Initialize Inputs
    reset = 1;
    enable = 0;
    newPC = 0;

    // Wait 100 ns for global reset to finish
    #100;
    
    // Deassert reset
    reset = 0; 
    enable = 1;
    newPC = 32'h0000_0004; // Assuming an increment by 4 (typical for 32-bit instructions)
    
    // Wait for a couple of clock cycles
    #20;
    
    // Load a new value into PC
    newPC = 32'h0000_00A0;
    
    // Wait for a couple of clock cycles
    #20;
    
    // Disable PC increment/loading
    enable = 0;

    // Wait for a couple of clock cycles to observe no change in PC
    #20;
    
    // Enable again with a different newPC
    enable = 1;
    newPC = 32'h0000_0100;

    // Wait and observe
    #20;
    
    // Assert reset to see if PC goes to 0
    reset = 1;
    #10;
    reset = 0; // Deassert reset
    
    // Finish simulation
    #10;
    $finish;
end

endmodule
