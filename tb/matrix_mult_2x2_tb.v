`timescale 1ns/1ps

module matrix_mult_2x2_tb;

reg clk;
reg reset;

reg [7:0] A00,A01,A10,A11;
reg [7:0] B00,B01,B10,B11;

wire [17:0] C00,C01,C10,C11;

matrix_mult_2x2 uut(

    .clk(clk),
    .reset(reset),

    .A00(A00),
    .A01(A01),
    .A10(A10),
    .A11(A11),

    .B00(B00),
    .B01(B01),
    .B10(B10),
    .B11(B11),

    .C00(C00),
    .C01(C01),
    .C10(C10),
    .C11(C11)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    reset = 1;

    #10;

    reset = 0;

    // Matrix A

    A00 = 1;
    A01 = 2;

    A10 = 3;
    A11 = 4;

    // Matrix B

    B00 = 5;
    B01 = 6;

    B10 = 7;
    B11 = 8;

    #20;

    $finish;

end

initial begin

    $monitor(
        "C00=%d C01=%d C10=%d C11=%d",
        C00,C01,C10,C11
    );

end

endmodule