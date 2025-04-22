// Simple testbench for project module
module testbench;
    reg clk;
    reg rst;
    wire puf_bit_out;

    // Instantiate the DUT
    project dut (
        .clk(clk),
        .rst(rst),
        .puf_bit_out(puf_bit_out)
    );

    // Clock Generation (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Simulation
    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, testbench);

        rst = 1;
        #20;
        rst = 0;

        #20000; // Run simulation for 20 us
        $display("Simulation finished. PUF bit = %b", puf_bit_out);

        // Automatically open GTKWave (Windows only)
        $display("Opening GTKWave...");
        $system("start C:/iverilog/gtkwave/bin/gtkwave.exe simulation.vcd");

        $finish;
    end
endmodule

