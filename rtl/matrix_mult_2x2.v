module matrix_mult_2x2(

    input clk,
    input reset,

    input [7:0] A00, A01,
    input [7:0] A10, A11,

    input [7:0] B00, B01,
    input [7:0] B10, B11,

    output reg [17:0] C00,
    output reg [17:0] C01,
    output reg [17:0] C10,
    output reg [17:0] C11
);

always @(posedge clk or posedge reset)
begin

    if(reset) begin

        C00 <= 0;
        C01 <= 0;
        C10 <= 0;
        C11 <= 0;

    end

    else begin

        C00 <= (A00 * B00) + (A01 * B10);

        C01 <= (A00 * B01) + (A01 * B11);

        C10 <= (A10 * B00) + (A11 * B10);

        C11 <= (A10 * B01) + (A11 * B11);

    end

end

endmodule