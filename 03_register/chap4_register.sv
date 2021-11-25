
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
        if (rst) q <= 4'b0;
        else q <= d;
endmodule

module flopenr(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [3:0] d,
    output logic [3:0] q
);

    always_ff @(posedge clk, posedge rst)
        if (rst) q <= 4'b0;
        else if (en) q <= d;
endmodule