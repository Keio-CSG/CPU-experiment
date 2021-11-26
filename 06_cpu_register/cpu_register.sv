module cpu_register(
    input logic [4:0] addr1,
    input logic [4:0] addr2,
    input logic [4:0] addrw,
    input logic writeen,
    input logic [31:0] writeint,
    input logic clk,
    output logic [31:0] RD1,
    output logic [31:0] RD2
);
    logic [31:0] DATA [31:0];
    // 初期値
    always @(posedge clk) begin
        DATA[0] = 49;
        DATA[1] = 7;
        DATA[2] = 3;
    end

    assign RD1 = DATA[addr1];
    assign RD2 = DATA[addr2];
    always @(posedge clk)
        if (writeen) DATA[addrw] <= writeint;
endmodule

// 1024行のCPUデータメモリ
module cpu_memory(
    input logic [9:0] addr,
    input logic writeen,
    input logic [31:0] writeint,
    input logic clk,
    output logic [31:0] RD
);
    logic [1023:0] DATA [31:0];
    // 実験用にRAMに数値を書き込みます。
    always @(*) begin
        DATA[0] = 49;
        DATA[1] = 7;
        DATA[2] = 2;
    end
    // メモリ動作
    assign RD = DATA[addr];
    always @(posedge clk)
        if (writeen) DATA[addr] <= writeint;
endmodule