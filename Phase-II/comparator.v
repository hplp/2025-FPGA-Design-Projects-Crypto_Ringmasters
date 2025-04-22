// Module: comparator
// Description: Compares counts from two frequency counters.
module comparator(
    input  wire [31:0] count_A,
    input  wire [31:0] count_B,
    output wire        puf_bit
);
    assign puf_bit = (count_A > count_B) ? 1'b1 : 1'b0;
endmodule
