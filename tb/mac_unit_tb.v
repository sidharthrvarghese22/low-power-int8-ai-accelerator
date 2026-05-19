`timescale 1ns/1ps

module mac_unit_tb;

reg [7:0] A;
reg [7:0] B;
reg [15:0] C;

wire [15:0] Y;

mac_unit uut (
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
);

initial begin

    A = 8'd2;
    B = 8'd3;
    C = 16'd4;

    #10;

    $display("Y = %d", Y);

    $finish;

end

endmodule