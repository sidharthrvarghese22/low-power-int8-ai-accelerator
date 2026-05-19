`timescale 1ns/1ps

module mac_array_tb;

reg clk;
reg reset;

reg [7:0] A0,B0;
reg [7:0] A1,B1;
reg [7:0] A2,B2;
reg [7:0] A3,B3;

wire [15:0] Y0,Y1,Y2,Y3;

mac_array uut(
    .clk(clk),
    .reset(reset),

    .A0(A0), .B0(B0),
    .A1(A1), .B1(B1),
    .A2(A2), .B2(B2),
    .A3(A3), .B3(B3),

    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;

    reset = 0;

    A0=2; B0=3;
    A1=4; B1=5;
    A2=6; B2=7;
    A3=8; B3=9;

    #10;

    $finish;

end

initial begin
    $monitor(
        "Y0=%d Y1=%d Y2=%d Y3=%d",
        Y0,Y1,Y2,Y3
    );
end

endmodule