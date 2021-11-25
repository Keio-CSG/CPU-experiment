
// 4b レジスタのテストベンチ
module addertest;
    // テスト信号を定義
    reg [3:0] d;
    reg clk;
    wire [3:0] q;

    // ここでは逐一ポートを割り当てています
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
    always #1
        clk = clk + 1;
    always #10 // 5周期毎に+1
        a <= a + 1;
    
endmodule