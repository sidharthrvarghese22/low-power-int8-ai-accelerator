module mac_unit(
    input [7:0] A,
    input [7:0] B,
    input [15:0] C,
    output [15:0] Y
);

assign Y = (A * B) + C;

endmodule