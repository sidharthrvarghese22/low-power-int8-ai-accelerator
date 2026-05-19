module sram_buffer(
    input clk,

    input we,

    input [1:0] addr,

    input [7:0] data_in,

    output reg [7:0] data_out
);

reg [7:0] memory [0:3];

always @(posedge clk)
begin

    if(we)
        memory[addr] <= data_in;

    data_out <= memory[addr];

end

endmodule