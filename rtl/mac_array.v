module mac_array(
    input clk,
    input reset,

    input [7:0] A0,
    input [7:0] B0,

    input [7:0] A1,
    input [7:0] B1,

    input [7:0] A2,
    input [7:0] B2,

    input [7:0] A3,
    input [7:0] B3,

    output [15:0] Y0,
    output [15:0] Y1,
    output [15:0] Y2,
    output [15:0] Y3
);

mac_unit_seq MAC0(
    .clk(clk),
    .reset(reset),
    .A(A0),
    .B(B0),
    .C(16'd0),
    .Y(Y0)
);

mac_unit_seq MAC1(
    .clk(clk),
    .reset(reset),
    .A(A1),
    .B(B1),
    .C(16'd0),
    .Y(Y1)
);

mac_unit_seq MAC2(
    .clk(clk),
    .reset(reset),
    .A(A2),
    .B(B2),
    .C(16'd0),
    .Y(Y2)
);

mac_unit_seq MAC3(
    .clk(clk),
    .reset(reset),
    .A(A3),
    .B(B3),
    .C(16'd0),
    .Y(Y3)
);

endmodule