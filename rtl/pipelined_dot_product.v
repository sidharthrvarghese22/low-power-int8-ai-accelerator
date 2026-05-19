module pipelined_dot_product(
    input clk,
    input reset,

    input [7:0] A0,B0,
    input [7:0] A1,B1,
    input [7:0] A2,B2,
    input [7:0] A3,B3,

    output reg [17:0] Y
);

reg [15:0] mult0,mult1,mult2,mult3;

reg [17:0] sum_stage;

always @(posedge clk or posedge reset)
begin

    if(reset) begin

        mult0 <= 0;
        mult1 <= 0;
        mult2 <= 0;
        mult3 <= 0;

        sum_stage <= 0;

        Y <= 0;

    end

    else begin

        // Stage 1: Multiplication

        mult0 <= A0 * B0;
        mult1 <= A1 * B1;
        mult2 <= A2 * B2;
        mult3 <= A3 * B3;

        // Stage 2: Accumulation

        sum_stage <= mult0 + mult1 + mult2 + mult3;

        // Stage 3: Output Register

        Y <= sum_stage;

    end

end

endmodule