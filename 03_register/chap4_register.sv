
module flop(
    input logic [3:0] d,
    input logic clk,
    output logic [3:0] q
);

    always_ff @(posedge clk)
        q <= d;
    
endmodule

module flopr(
    input logic clk,
    input logic rst,
    input logic [3:0] d,
    output logic [3:0] q
);

    always_ff @(posedge clk, posedge rst)
        if (reset) q <= 4'b0;
        else q <= d;
endmodule

