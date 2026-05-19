module mac_unit_seq(
    input clk,
    input reset,
    input [7:0] A,
    input [7:0] B,
    input [15:0] C,
    output reg [15:0] Y
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        Y <= 16'd0;

    else
        Y <= (A * B) + C;
end

endmodule