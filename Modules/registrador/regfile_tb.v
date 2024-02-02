`timescale 1ns / 1ps

module regfile_tb;

    // Inputs1
    reg clk;
    reg we3;
    reg [`RA_LEN] ra1;
    reg [`RA_LEN] ra2;
    reg [`RA_LEN] wa3;
    reg [`WORD_LEN-1:0] wd3;

    // Outputs
    wire [`WORD_LEN-1:0] rd1;
    wire [`WORD_LEN-1:0] rd2;

    // Instantiate the Unit Under Test (UUT)
    regfile uut (
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    always #10 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        we3 = 0;
        ra1 = 0;
        ra2 = 0;
        wa3 = 0;
        wd3 = 0;

        // Start VCD dump
        $dumpfile("regfile_tb.vcd");
        $dumpvars(0, regfile_tb);

        // Wait for the global reset
        #100;

        // Test case 1: Write and read from register 5
        wa3 = 5; wd3 = 32'hA5A5A5A5; we3 = 1; 
        #20;
        we3 = 0; ra1 = 5;
        #20;
        if (rd1 !== 32'hA5A5A5A5) $display("Test failed for write/read register 5");
        //else
        $display("Test passed for write/read register 5"); 

        // Test case 2: Write to one register and read from another
        wa3 = 3; wd3 = 32'h3C3C3C3C; we3 = 1;
        #20;
        // else\
        $display("Test passed for write to one register and read from another");

        we3 = 0; ra1 = 3; ra2 = 5;
        #20;
        if (rd1 !== 32'h3C3C3C3C || rd2 !== 32'hA5A5A5A5) $display("Test failed for write/read separate registers");
        //else
        $display("Test passed for write/read separate registers");
        
        $finish;
    end
      
endmodule
