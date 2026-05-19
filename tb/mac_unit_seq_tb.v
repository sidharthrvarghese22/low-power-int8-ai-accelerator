`timescale 1ns/1ps

module mac_unit_seq_tb;

reg clk;
reg reset;

reg [7:0] A;
reg [7:0] B;
reg [15:0] C;

wire [15:0] Y;

mac_unit_seq uut(
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    A = 0;
    B = 0;
    C = 0;

    #10;

    reset = 0;

    A = 2;
    B = 3;
    C = 4;

    #10;

    A = 5;
    B = 2;
    C = 1;

    #10;

    $finish;

end

initial begin
    $monitor(
        "Time=%0t A=%d B=%d C=%d Y=%d",
        $time, A, B, C, Y
    );
end

endmodule