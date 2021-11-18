module addertest;

// テスト信号を定義
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

// adderを呼び出し配線を定義
adder4 u1(.a (a),
           .b (b),
           .cin (cin),
           .sum (sum),
           .cout (cout)
           );

// 信号の動きを宣言
// 初期値
initial begin
    a = 0;
    b = 0;
    cin = 0;
end

// 周期変動
// ノンブロッキング代入することで遷移を同時にする。
always #5 // 5周期毎に+1
    a <= a + 1;

always #10
    b <= b + 1;

endmodule