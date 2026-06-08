`timescale 1ns / 1ps

module test_bench(); // Notice: Testbenches have NO input/output ports!

    reg [3:0] tb_X0;
    reg [3:0] tb_X1;
    wire [3:0] tb_Y;
    wire tb_COUT;

    ripple_adder uut (
        .X0(tb_X0),
        .X1(tb_X1),
        .Y(tb_Y),
        .COUT(tb_COUT)
    );

    initial begin
        // Monitor values dynamically in the Vivado console log
        $monitor("Time = %0dt | X0 = %d, X1 = %d | Sum Y = %d, COUT = %b", $time, tb_X0, tb_X1, tb_Y, tb_COUT);

        // Test Case 1: Simple Addition (2 + 3 = 5)
        tb_X0 = 4'd2; tb_X1 = 4'd3;
        #10; // Wait 10 nanoseconds
        
        // Test Case 2: Max values without overflow (10 + 5 = 15)
        tb_X0 = 4'd10; tb_X1 = 4'd5;
        #10;
        
        // Test Case 3: Triggering an Overflow / Carry out (12 + 6 = 18 -> 2 with COUT=1)
        tb_X0 = 4'd12; tb_X1 = 4'd6;
        #10;
        
        // Test Case 4: Absolute maximum possible inputs (15 + 15 = 30 -> 14 with COUT=1)
        tb_X0 = 4'd15; tb_X1 = 4'd15;
        #10;

        // End the simulation safely
        $finish;
    end

endmodule