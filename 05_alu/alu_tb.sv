// ALUのテストベンチ
module alutest;
    // テスト信号を定義
    reg [31:0] a;
    reg [31:0] b;
    reg [1:0] sel;
    wire [31:0] out;

    alu u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        sel = 0;
        a = 0;
        b = 0;
        #300 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #1
        a = a + 1;
    always #5
        b = b + 1;
    always #30
        sel = sel + 1;
endmodule