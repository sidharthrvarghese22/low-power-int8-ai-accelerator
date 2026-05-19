`timescale 1ns/1ps

module sram_buffer_tb;

reg clk;
reg we;

reg [1:0] addr;
reg [7:0] data_in;

wire [7:0] data_out;

sram_buffer uut(
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    we = 1;

    addr = 0;
    data_in = 8'd2;

    #10;

    addr = 1;
    data_in = 8'd4;

    #10;

    addr = 2;
    data_in = 8'd6;

    #10;

    addr = 3;
    data_in = 8'd8;

    #10;

    we = 0;

    addr = 0;
    #10;

    addr = 1;
    #10;

    addr = 2;
    #10;

    addr = 3;
    #10;

    $finish;

end

initial begin
    $monitor(
        "Addr=%d DataOut=%d",
        addr,
        data_out
    );
end

endmodule