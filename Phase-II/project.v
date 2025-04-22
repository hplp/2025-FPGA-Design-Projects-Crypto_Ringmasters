// ============================================================
// Synthesizable Ring Oscillator A (faster toggle)
module ring_oscillator_A(
    input wire clk,
    output reg osc_out
);
    reg [3:0] div;

    always @(posedge clk) begin
        div <= div + 1;
        osc_out <= div[1]; // Adjust for desired frequency
    end
endmodule

// ============================================================
// Synthesizable Ring Oscillator B (slower toggle)
module ring_oscillator_B(
    input wire clk,
    output reg osc_out
);
    reg [7:0] div;

    always @(posedge clk) begin
        div <= div + 1;
        osc_out <= div[7]; // Slower toggle
    end
endmodule

// ============================================================
// Frequency Counter Module
module freq_counter(
    input  wire clk,
    input  wire rst,
    input  wire osc_in,
    output reg [31:0] count
);
    reg osc_in_d;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 32'd0;
            osc_in_d <= 1'b0;
        end else begin
            osc_in_d <= osc_in;
            if (osc_in & ~osc_in_d)  // Rising edge detection
                count <= count + 1;
        end
    end
endmodule

// ============================================================
// Comparator Module
module comparator(
    input  wire [31:0] count_A,
    input  wire [31:0] count_B,
    output wire        puf_bit
);
    assign puf_bit = (count_A > count_B) ? 1'b1 : 1'b0;
endmodule

// ============================================================
// Control FSM (placeholder - not actively controlling logic yet)
module control_fsm(
    input  wire clk,
    input  wire rst,
    output wire enable_ro,
    output wire start_count,
    output wire done
);
    assign enable_ro   = 1'b1;
    assign start_count = 1'b1;
    assign done        = 1'b0;
endmodule

// ============================================================
// Top-Level Module
module project (
    input  wire clk,
    input  wire rst,
    output wire puf_bit_out
);

    wire osc_out_A, osc_out_B;
    wire [31:0] count_A, count_B;
    wire puf_bit;
    wire enable_ro, start_count, done;

    // Replace simulated oscillators with synthesizable ones
    ring_oscillator_A ro_A (
        .clk(clk),
        .osc_out(osc_out_A)
    );

    ring_oscillator_B ro_B (
        .clk(clk),
        .osc_out(osc_out_B)
    );

    // Frequency Counters
    freq_counter counter_A (
        .clk(clk),
        .rst(rst),
        .osc_in(osc_out_A),
        .count(count_A)
    );

    freq_counter counter_B (
        .clk(clk),
        .rst(rst),
        .osc_in(osc_out_B),
        .count(count_B)
    );

    // Comparator
    comparator comp (
        .count_A(count_A),
        .count_B(count_B),
        .puf_bit(puf_bit)
    );

    // FSM to control timing
    control_fsm fsm (
        .clk(clk),
        .rst(rst),
        .enable_ro(enable_ro),
        .start_count(start_count),
        .done(done)
    );

    assign puf_bit_out = puf_bit;

endmodule
