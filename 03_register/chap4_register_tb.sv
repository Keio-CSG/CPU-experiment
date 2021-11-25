
// 4b レジスタのテストベンチ
module floptest;
    // テスト信号を定義
    reg [3:0] d;
    reg clk;
    wire [3:0] q;

    flop u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        d = 0;
        clk = 0;
        #100 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #5
        clk = clk + 1;
    always #1 
        d <= d + 1;
    
endmodule

// 4b リセット付きレジスタのテストベンチ
module floprtest;
    // テスト信号を定義
    reg [3:0] d;
    reg clk;
    reg rst;
    wire [3:0] q;

    flopr u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        d = 0;
        clk = 0;
        rst = 1;
        #20 rst = 0; // 20後、rstを立ち下げる
        #100 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #5
        clk = clk + 1;
    always #1 
        d <= d + 1;
    
endmodule