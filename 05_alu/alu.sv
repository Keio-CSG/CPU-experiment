
module adder(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out,
);

    assign out = a + b;
endmodule

module sub(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out,
);

    assign out = a - b;
endmodule

module multiplier(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out,
);

    assign out = a * b;
endmodule

module divider(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out,
);

    assign out = a / b;
endmodule

module alu(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [2:0] sel,
    output logic [31:0] out
);

    logic [31:0] a1
    adder add(.a (a), .b (b), .out (a1))

    logic [31:0] a2
    sub sub2(.a (a), .b (b), .out (a2))

    logic [31:0] a3
    multiplier mul(.a (a), .b (b), .out (a3))

    if ()