// Synthesizable "fake" ring oscillators using clock dividers

// Ring Oscillator A (faster toggle)
module ring_oscillator_A(
    input wire clk,
    output reg osc_out
);
    reg [3:0] div;

    always @(posedge clk) begin
        div <= div + 1;
        osc_out <= div[1];  // You can tweak the bit index for speed
    end
endmodule

// Ring Oscillator B (slower toggle)
module ring_oscillator_B(
    input wire clk,
    output reg osc_out
);
    reg [7:0] div;

    always @(posedge clk) begin
        div <= div + 1;
        osc_out <= div[7];  // Slower toggle
    end
endmodule
