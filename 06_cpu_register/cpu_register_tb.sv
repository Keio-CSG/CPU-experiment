
// レジスタに読み書きするテストベンチ
module regtest;
    // テスト信号を定義。大変なのでモジュールと同じ名前で
    reg [4:0] addr1;
    reg [4:0] addr2;
    reg [4:0] addrw;
    reg writeen;
    reg [31:0] writeint;
    reg clk;
    wire [31:0] RD1;
    wire [31:0] RD2;

    // レジスタモジュール呼び出し
    cpu_register u1(.*);

    // 信号の動きを宣言
    // 初期値
    initial begin
        clk = 0;
        writeen = 1;
        writeint = 0;
        addrw = 0;
        addr1 = 0;
        addr2 = 0;
        #300 $stop; // 終了時間の定義。これがないと延々に回ってしまう！
    end

    // 周期変動
    // ノンブロッキング代入することで遷移を同時にする。
    always #1 begin
        writeint = writeint + 1;
        clk = clk + 1;
    end
    always #2 begin
        addr1 = addr1 + 1;
        addr2 = addr2 + 1;
    end
    always #5
        addrw = addrw + 1;
endmodule