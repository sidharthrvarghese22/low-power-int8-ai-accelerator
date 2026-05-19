module dot_product_engine(
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

    output reg [17:0] Y
);

wire [15:0] M0;
wire [15:0] M1;
wire [15:0] M2;
wire [15:0] M3;

mac_unit_seq MAC0(
    .clk(clk),
    .reset(reset),
    .A(A0),
    .B(B0),
    .C(16'd0),
    .Y(M0)
);

mac_unit_seq MAC1(
    .clk(clk),
    .reset(reset),
    .A(A1),
    .B(B1),
    .C(16'd0),
    .Y(M1)
);

mac_unit_seq MAC2(
    .clk(clk),
    .reset(reset),
    .A(A2),
    .B(B2),
    .C(16'd0),
    .Y(M2)
);

mac_unit_seq MAC3(
    .clk(clk),
    .reset(reset),
    .A(A3),
    .B(B3),
    .C(16'd0),
    .Y(M3)
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        Y <= 0;

    else
        Y <= M0 + M1 + M2 + M3;
end

endmodule