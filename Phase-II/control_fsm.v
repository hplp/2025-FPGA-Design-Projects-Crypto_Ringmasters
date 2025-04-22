// Module: control_fsm
// Description: FSM to control PUF key extraction sequence
module control_fsm(
    input  wire clk,
    input  wire rst,
    output reg  enable_ro,
    output reg  start_count,
    output reg  done
);
    reg [1:0] state, next_state;
    parameter IDLE = 2'b00, MEASURE = 2'b01, WAIT = 2'b10, DONE = 2'b11;

    reg [15:0] wait_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            wait_counter <= 16'd0;
        end else begin
            state <= next_state;
            if (state == WAIT)
                wait_counter <= wait_counter + 1;
            else
                wait_counter <= 16'd0;
        end
    end

    always @(*) begin
        enable_ro = 0;
        start_count = 0;
        done = 0;
        next_state = state;

        case (state)
            IDLE: begin
                next_state = MEASURE;
            end
            MEASURE: begin
                enable_ro = 1;
                start_count = 1;
                next_state = WAIT;
            end
            WAIT: begin
                enable_ro = 1;
                start_count = 1;
                if (wait_counter > 16'd10000)
                    next_state = DONE;
            end
            DONE: begin
                done = 1;
                next_state = IDLE;
            end
        endcase
    end
endmodule
