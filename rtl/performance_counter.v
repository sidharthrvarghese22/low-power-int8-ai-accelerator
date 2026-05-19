module performance_counter(
    input clk,
    input reset,
    input enable,

    output reg [31:0] cycles
);

always @(posedge clk or posedge reset)
begin

    if(reset)
        cycles <= 0;

    else if(enable)
        cycles <= cycles + 1;

end

endmodule