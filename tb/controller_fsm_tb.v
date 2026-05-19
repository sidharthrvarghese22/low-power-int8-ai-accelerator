`timescale 1ns/1ps

module controller_fsm_tb;

reg clk;
reg reset;
reg start;

wire load;
wire compute;
wire done;

controller_fsm uut(
    .clk(clk),
    .reset(reset),
    .start(start),

    .load(load),
    .compute(compute),
    .done(done)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    reset = 1;
    start = 0;

    #10;

    reset = 0;

    #10;

    start = 1;

    #10;

    start = 0;

    #50;

    $finish;

end

initial begin

    $monitor(
        "Time=%0t Load=%b Compute=%b Done=%b",
        $time,
        load,
        compute,
        done
    );

end

endmodule