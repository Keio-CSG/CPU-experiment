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

    assign instruction = INST[a];
endmodule
    