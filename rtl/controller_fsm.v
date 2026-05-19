module controller_fsm(
    input clk,
    input reset,
    input start,

    output reg load,
    output reg compute,
    output reg done
);

reg [1:0] state;

parameter IDLE    = 2'b00;
parameter LOAD    = 2'b01;
parameter COMPUTE = 2'b10;
parameter DONE    = 2'b11;

always @(posedge clk or posedge reset)
begin

    if(reset)
        state <= IDLE;

    else begin

        case(state)

            IDLE:
                if(start)
                    state <= LOAD;

            LOAD:
                state <= COMPUTE;

            COMPUTE:
                state <= DONE;

            DONE:
                state <= IDLE;

        endcase

    end

end

always @(*)
begin

    load = 0;
    compute = 0;
    done = 0;

    case(state)

        IDLE: begin
        end

        LOAD: begin
            load = 1;
        end

        COMPUTE: begin
            compute = 1;
        end

        DONE: begin
            done = 1;
        end

    endcase

end

endmodule