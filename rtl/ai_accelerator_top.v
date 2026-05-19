module ai_accelerator_top(
    input clk,
    input reset,
    input start,

    output [17:0] result,
    output done,

    output [31:0] cycle_count
);

wire load;
wire compute;

// FSM Controller

controller_fsm CTRL(
    .clk(clk),
    .reset(reset),
    .start(start),

    .load(load),
    .compute(compute),
    .done(done)
);

// Input Registers

reg [7:0] A0,A1,A2,A3;
reg [7:0] B0,B1,B2,B3;

// Load Data into Registers

always @(posedge clk or posedge reset)
begin

    if(reset) begin

        A0 <= 0; B0 <= 0;
        A1 <= 0; B1 <= 0;
        A2 <= 0; B2 <= 0;
        A3 <= 0; B3 <= 0;

    end

    else if(load) begin

        A0 <= 8'd2;
        B0 <= 8'd3;

        A1 <= 8'd4;
        B1 <= 8'd5;

        A2 <= 8'd6;
        B2 <= 8'd7;

        A3 <= 8'd8;
        B3 <= 8'd9;

    end

end

// Clock Gating

wire gated_clk;

assign gated_clk = clk & compute;

// Dot Product Engine

dot_product_engine DPE(
    .clk(gated_clk),
    .reset(reset),

    .A0(A0),
    .B0(B0),

    .A1(A1),
    .B1(B1),

    .A2(A2),
    .B2(B2),

    .A3(A3),
    .B3(B3),

    .Y(result)
);

// Performance Counter

performance_counter PERF(
    .clk(clk),
    .reset(reset),
    .enable(compute),
    .cycles(cycle_count)
);

endmodule