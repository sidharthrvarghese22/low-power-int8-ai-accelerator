module systolic_array_2x2(

    input clk,
    input reset,

    input [7:0] A00,
    input [7:0] A01,

    input [7:0] A10,
    input [7:0] A11,

    input [7:0] B00,
    input [7:0] B01,

    input [7:0] B10,
    input [7:0] B11,

    output [17:0] C00,
    output [17:0] C01,
    output [17:0] C10,
    output [17:0] C11
);

wire [7:0] A_wire0, A_wire1;
wire [7:0] B_wire0, B_wire1;

wire [17:0] acc00, acc01, acc10, acc11;

// PE00

processing_element PE00(

    .clk(clk),
    .reset(reset),

    .A_in(A00),
    .B_in(B00),

    .acc_in(0),

    .A_out(A_wire0),
    .B_out(B_wire0),

    .acc_out(acc00)
);

// PE01

processing_element PE01(

    .clk(clk),
    .reset(reset),

    .A_in(A_wire0),
    .B_in(B01),

    .acc_in(0),

    .A_out(),
    .B_out(B_wire1),

    .acc_out(acc01)
);

// PE10

processing_element PE10(

    .clk(clk),
    .reset(reset),

    .A_in(A10),
    .B_in(B_wire0),

    .acc_in(0),

    .A_out(A_wire1),
    .B_out(),

    .acc_out(acc10)
);

// PE11

processing_element PE11(

    .clk(clk),
    .reset(reset),

    .A_in(A_wire1),
    .B_in(B_wire1),

    .acc_in(0),

    .A_out(),
    .B_out(),

    .acc_out(acc11)
);

assign C00 = acc00;
assign C01 = acc01;
assign C10 = acc10;
assign C11 = acc11;

endmodule