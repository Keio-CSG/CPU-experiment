// 4則演算器のモジュールを定義
module adder(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out);

    assign out = a + b;
endmodule

module sub(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out
);

    assign out = a - b;
endmodule

module multiplier(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out
);

    assign out = a * b;
endmodule

module divider(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] out
);

    assign out = a / b;
endmodule

// 統合したALUモジュール
module alu(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [1:0] sel,
    output logic [31:0] out
);

    // それぞれの演算器をモジュールとして呼び出し
    logic [31:0] y1;
    adder add(.a (a), .b (b), .out (y1));

    logic [31:0] y2;
    sub sub2(.a (a), .b (b), .out (y2));

    logic [31:0] y3;
    multiplier mul(.a (a), .b (b), .out (y3));

    logic [31:0] y4;
    divider div(.a (a), .b (b), .out (y4));

    // 一つの出力を選択
    // 4:1 multiplexer
    assign out = sel[1] ? (sel[0] ? y4 : y3)
            : (sel[0] ? y2 : y1);
endmodule