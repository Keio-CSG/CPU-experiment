module cpu_tb;
    reg [31:0] inst;
    reg clk;

    // 加算命令
    initial begin
        inst = 32'b00000000000010000010000000000000;
        clk = 0;
    end
    // CPU
    cpuv1 c1(.*);

    always #2
        clk = clk + 1;
endmodule