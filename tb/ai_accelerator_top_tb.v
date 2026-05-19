`timescale 1ns/1ps

module ai_accelerator_top_tb;

reg clk;
reg reset;
reg start;

wire [17:0] result;
wire done;

wire [31:0] cycle_count;

// Instantiate Top Module

ai_accelerator_top uut(
    .clk(clk),
    .reset(reset),
    .start(start),

    .result(result),
    .done(done),

    .cycle_count(cycle_count)
);

// Clock Generation

always #5 clk = ~clk;

// Generate Waveform Dump File

initial begin

    $dumpfile("sim/ai_accelerator.vcd");

    $dumpvars(0, ai_accelerator_top_tb);

end

// Test Sequence

initial begin

    clk = 0;

    reset = 1;
    start = 0;

    // Hold Reset

    #10;

    reset = 0;

    // Start Accelerator

    #10;

    start = 1;

    #10;

    start = 0;

    // Wait for Computation

    #100;

    $finish;

end

// Monitor Outputs

initial begin

    $monitor(
        "Time=%0t | Result=%d | Done=%b | Cycles=%d",
        $time,
        result,
        done,
        cycle_count
    );

end

endmodule