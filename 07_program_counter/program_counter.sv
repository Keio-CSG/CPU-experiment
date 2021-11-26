// simple counter
module program_counter(
    input logic rst,
    input logic clk,
    output logic [7:0] pc
);

    always @(posedge rst, posedge clk) begin
        if (rst) pc <= 0;
        else pc = pc + 1;
    end
endmodule

// instruction set memory
module instruction_memory(
    input logic [7:0] a,
    output logic [31:0] instruction
);

    logic [255:0] INST [31:0];
    // 実験用にデータを書き込みます。
    INST[0] =  // DATA[0]をレジスタ[0]に読み込み
               // DATA[1]をレジスタ[1]に読み込み
               // reg[0] + reg[1]をreg[2]に書き込み
    assign instruction = INST[a];
endmodule
    