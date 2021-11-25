
// 0-255まで数えるカウンタ
module counter(
    input logic clk,
    input logic rst,
    output logic [7:0] out
);

    always_ff @(posedge clk, posedge rst)
        if (rst) out <= 8'b0;
        else out <= out + 1;
endmodule
