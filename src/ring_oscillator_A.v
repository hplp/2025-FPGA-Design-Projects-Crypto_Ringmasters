// Ring Oscillator A - Full-speed (125 MHz)
module ring_oscillator_A(
    input wire clk,
    output wire osc_out
);
    // Pass-through clock
    assign osc_out = clk;
endmodule
