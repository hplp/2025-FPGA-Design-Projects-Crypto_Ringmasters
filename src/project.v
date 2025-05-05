// project.v - Top-level module for PYNQ-Z1
module project (
    input wire clk,         // System clock from PYNQ
    input wire rst,         // Active-high reset signal
    output wire puf_bit_out, // Drives LED when PUF bit is 1
    output wire led_on       // NEW: constant ON LED output
);

    // Internal wires
    wire start;
    wire done;
    wire [7:0] count_a;
    wire [7:0] count_b;
    wire puf_bit;

    // FSM controller to orchestrate comparison
    control_fsm ctrl (
        .clk(clk),
        .rst(rst),
        .enable_ro(start),
        .start_count(start),
        .done(done)
    );

    // Ring Oscillators
    wire ro_clk_a, ro_clk_b;

    ring_oscillator_A ro_a (
        .clk(clk),
        .osc_out(ro_clk_a)
    );

    ring_oscillator_B ro_b (
        .clk(clk),
        .osc_out(ro_clk_b)
    );

    // Frequency counters
    freq_counter cnt_a (
        .clk(clk),
        .rst(rst),
        .osc_in(ro_clk_a),
        .count(count_a)
    );

    freq_counter cnt_b (
        .clk(clk),
        .rst(rst),
        .osc_in(ro_clk_b),
        .count(count_b)
    );

    // Comparator
    comparator cmp (
        .count_A(count_a),
        .count_B(count_b),
        .puf_bit(puf_bit)
    );

    // Output to LED or GPIO
    assign puf_bit_out = puf_bit;

    // NEW: Constant ON LED for debug or power check
    assign led_on = 1'b1;

endmodule
