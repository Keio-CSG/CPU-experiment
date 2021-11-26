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
    assign INST[0] = 32'b00000000000000000000000000000100; // DATA[0]をレジスタ[0]に読み込み
    assign INST[1] = 32'b00000000000000000010000100000100;          // DATA[1]をレジスタ[1]に読み込み
    assign INST[2] = 32'b00000000000010000010000000000000;
    //引き算
    // INST[2] = 32'b00000000000010000010000000000001
    
    assign INST[3] = 32'b00000000000000000100001000000101; //reg[2]をDATA[2]に書き込み
    
    assign instruction = INST[a];
endmodule
    