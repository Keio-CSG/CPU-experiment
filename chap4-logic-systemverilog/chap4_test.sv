// テキスト4章のテストベンチ例
// 吉岡

// 4bit 加算器のテストベンチ
module addertest;
    // テスト信号を定義
    reg [3:0] a,b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // adderを呼び出し配線を定義
    // ここでは逐一ポートを割り当てています
    adder4 u1(.a (a),
            .b (b),
            .cin (cin),
            .sum (sum),
            .cout (cout)
            );
    // SystemVerilogでは adder4 u1(.*) でもオッケー。楽だね。
    // ただモジュールのポートとテストベンチの配線名が一致していること。

    // 信号の動きを宣言
    // 初期値
    initial begin
        a = 0;
        b = 0;
        cin = 0;
        #1000 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #5 // 5周期毎に+1
        a <= a + 1;
    always #10
        b <= b + 1;
endmodule


// インバータのテストベンチ
module invtest;
    // テスト信号を定義
    logic [3:0] a; // 入力
    logic [3:0] y; // 出力

    // inv4を呼び出し配線を定義
    // ポートの暗黙一致を使用。楽ちん。
    inv4 u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        a = 0;
        #1000 $stop; // 終了時間の定義
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #5 // 5周期毎に+1
        a <= a + 1;
endmodule