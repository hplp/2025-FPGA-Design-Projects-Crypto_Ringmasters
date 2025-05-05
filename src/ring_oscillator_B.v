// Ring Oscillator B - Slow (~1 MHz)
module ring_oscillator_B(
    input wire clk,
    output reg osc_out
);
    reg [6:0] div;

    always @(posedge clk) begin
        div <= div + 1;
        osc_out <= div[6];  // Divide by ~128
    end
endmodule
