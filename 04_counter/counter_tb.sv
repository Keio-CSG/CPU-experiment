

// 4b リセット付きレジスタのテストベンチ
module countertest;
    // テスト信号を定義
    reg clk;
    reg rst;
    wire [7:0] out;

    counter u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0; // 20後、rstを立ち下げる
        #300 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #1
        clk = clk + 1;
endmodule