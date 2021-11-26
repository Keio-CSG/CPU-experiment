// reg+ALUのみCPU

module cpuv1(
    input logic clk,
    input logic [31:0] inst
);

    logic [31:0] a,b;
    logic [1:0] sel;
    logic [31:0] out;
    alu a1(.*);

    logic [4:0] addr1, addr2, addrw;
    logic writeen;
    cpu_register r1(
        .addr1(addr1),
        .addr2(addr2),
        .addrw(addr2),
        .writeen(writeen),
        .writeint(out),
        .RD1(a),
        .RD2(b),
        .clk(clk));

    assign sel = {inst[1:0]};
    assign addr1 = {inst[12:8]};
    assign addr2 = {inst[17:13]};
    assign addrw = {inst[22:18]};
    assign writeen = (inst[2:0] < 4);
endmodule