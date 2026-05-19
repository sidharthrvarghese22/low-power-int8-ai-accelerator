module processing_element(

    input clk,
    input reset,

    input [7:0] A_in,
    input [7:0] B_in,

    input [17:0] acc_in,

    output reg [7:0] A_out,
    output reg [7:0] B_out,

    output reg [17:0] acc_out
);

always @(posedge clk or posedge reset)
begin

    if(reset) begin

        A_out <= 0;
        B_out <= 0;
        acc_out <= 0;

    end

    else begin

        acc_out <= acc_in + (A_in * B_in);

        A_out <= A_in;

        B_out <= B_in;

    end

end

endmodule