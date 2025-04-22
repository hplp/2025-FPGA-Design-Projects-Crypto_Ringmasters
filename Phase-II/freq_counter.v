// Module: freq_counter
// Description: Counts rising edges of oscillator signal using system clock
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
            if (osc_in & ~osc_in_d)  // Detect rising edge
                count <= count + 1;
        end
    end
endmodule
