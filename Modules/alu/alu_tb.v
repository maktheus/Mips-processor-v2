`timescale 1ns / 1ps

module alu_tb;

    // Inputs
    reg [`WORD_LEN-1:0] a;
    reg [`WORD_LEN-1:0] b;
    reg [`EXE_CMD_LEN:0] alucontrol;  // Usando `EXE_CMD_LEN`

    // Outputs
    wire [`WORD_LEN-1:0] result;
    wire zero;

    // Instantiate the Unit Under Test (UUT)
    alu uut (
        .a(a), 
        .b(b), 
        .alucontrol(alucontrol), 
        .result(result), 
        .zero(zero)
    );

    // Test procedure
    initial begin

         
        // Initialize Inputs
        a = 0;
        b = 0;
        alucontrol = 0;

        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);


        // Add test cases here
        // Test Case 1: ADD operation
        a = 15; b = 10; alucontrol = 3'b010;
        #10; // wait for 10 time units
        if (result !== 25) $display("ADD operation failed");
        // else
        $display("ADD operation passed");
        // Test Case 2: SUBTRACT operation
        a = 15; b = 10; alucontrol = 3'b110;
        #10; // wait for 10 time units
        if (result !== 5) $display("SUBTRACT operation failed");
        // else
        $display("SUBTRACT operation passed");
        // Test Case 3: AND operation
        a = 12; b = 5; alucontrol = 3'b000;
        #10;
        if (result !== (12 & 5)) $display("AND operation failed");
        // else
        $display("AND operation passed");

        // Test Case 4: OR operation
        a = 12; b = 5; alucontrol = 3'b001;
        #10;
        if (result !== (12 | 5)) $display("OR operation failed");
        //else
        $display("OR operation passed"); 

        // Test Case 5: SET LESS THAN operation
        a = 5; b = 12; alucontrol = 3'b111;
        #10;
        if (result !== 1) $display("SET LESS THAN operation failed");
        // else
        $display("SET LESS THAN operation passed");
        
        // Finish the simulation
        $finish;
    end
      
endmodule